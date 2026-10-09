#include "pbv_parser.h"

#include <algorithm>
#include <cctype>
#include <fstream>
#include <map>
#include <memory>
#include <sstream>
#include <stdexcept>
#include <unordered_map>
#include <unordered_set>
#include <vector>

namespace pbv {

namespace {

struct SExpr;
using SP = std::shared_ptr<SExpr>;

struct SExpr
{
  bool is_atom = true;
  std::string atom;
  std::vector<SP> kids;
  // On a binder (declared symbol, define-fun parameter, quantified variable,
  // UF sort position): its union-find node. On an atom with an empty name:
  // a placeholder for the width of that node.
  int node = -1;
  // On (pbvsize t): the inferred width of t.
  SP width;
  // On an integer form: it mentions a symbol that is not visible at the
  // top level, so it cannot serve as the width of a global sort.
  bool local = false;
};

SP mk_atom(const std::string & a)
{
  SP e = std::make_shared<SExpr>();
  e->atom = a;
  return e;
}

SP mk_list(const std::vector<SP> & kids)
{
  SP e = std::make_shared<SExpr>();
  e->is_atom = false;
  e->kids = kids;
  for (const SP & k : kids)
  {
    e->local = e->local || !k || k->local;
  }
  return e;
}

SP mk_placeholder(int node)
{
  SP e = std::make_shared<SExpr>();
  e->node = node;
  return e;
}

bool is_placeholder(const SP & e) { return e && e->is_atom && e->atom.empty(); }

bool is_numeral(const std::string & s)
{
  return !s.empty()
         && std::all_of(s.begin(), s.end(), [](char c) { return isdigit(c); });
}

bool has_placeholder(const SP & e)
{
  if (is_placeholder(e)) return true;
  if (e->is_atom) return false;
  for (const SP & k : e->kids)
  {
    if (has_placeholder(k)) return true;
  }
  return false;
}

std::string to_string(const SP & e)
{
  if (e->is_atom)
  {
    return is_placeholder(e) ? "#w" + std::to_string(e->node) : e->atom;
  }
  std::string s = "(";
  for (size_t i = 0; i < e->kids.size(); ++i)
  {
    if (i) s += " ";
    s += to_string(e->kids[i]);
  }
  return s + ")";
}

// ---------------------------------------------------------------------------
// Reading s-expressions

class Reader
{
 public:
  Reader(const std::string & text) : t(text), pos(0) {}

  std::vector<SP> read_all()
  {
    std::vector<SP> res;
    std::string tok;
    while (next(tok))
    {
      res.push_back(read(tok));
    }
    return res;
  }

 private:
  const std::string & t;
  size_t pos;

  bool next(std::string & tok)
  {
    while (pos < t.size())
    {
      char c = t[pos];
      if (isspace(static_cast<unsigned char>(c)))
      {
        ++pos;
      }
      else if (c == ';')
      {
        while (pos < t.size() && t[pos] != '\n') ++pos;
      }
      else
      {
        break;
      }
    }
    if (pos >= t.size()) return false;
    size_t start = pos;
    char c = t[pos];
    if (c == '(' || c == ')')
    {
      ++pos;
    }
    else if (c == '|')
    {
      pos = t.find('|', pos + 1);
      if (pos == std::string::npos) throw std::runtime_error("unterminated |symbol|");
      ++pos;
    }
    else if (c == '"')
    {
      ++pos;
      while (true)
      {
        pos = t.find('"', pos);
        if (pos == std::string::npos) throw std::runtime_error("unterminated string");
        ++pos;
        // "" is an escaped quote inside a string literal
        if (pos < t.size() && t[pos] == '"')
        {
          ++pos;
          continue;
        }
        break;
      }
    }
    else
    {
      while (pos < t.size())
      {
        c = t[pos];
        if (isspace(static_cast<unsigned char>(c)) || c == '(' || c == ')'
            || c == ';' || c == '"' || c == '|')
        {
          break;
        }
        ++pos;
      }
    }
    tok = t.substr(start, pos - start);
    return true;
  }

  SP read(const std::string & first)
  {
    if (first == ")") throw std::runtime_error("unexpected ')'");
    if (first != "(") return mk_atom(first);
    std::vector<SP> kids;
    std::string tok;
    while (true)
    {
      if (!next(tok)) throw std::runtime_error("missing ')'");
      if (tok == ")") break;
      kids.push_back(read(tok));
    }
    SP e = std::make_shared<SExpr>();
    e->is_atom = false;
    e->kids = kids;
    return e;
  }
};

// ---------------------------------------------------------------------------
// Operator tables

const std::unordered_set<std::string> same_width_ops = {
  "pbvnot",  "pbvneg",  "pbvand",  "pbvor",   "pbvxor",  "pbvnand", "pbvnor",
  "pbvxnor", "pbvadd",  "pbvsub",  "pbvmul",  "pbvudiv", "pbvurem", "pbvsdiv",
  "pbvsrem", "pbvsmod", "pbvshl",  "pbvlshr", "pbvashr"
};

const std::unordered_set<std::string> predicates = {
  "pbvult", "pbvule", "pbvugt", "pbvuge", "pbvslt", "pbvsle", "pbvsgt", "pbvsge"
};

// PBV operator name -> ALL operator name
std::string rename_op(const std::string & op)
{
  if (same_width_ops.count(op) || predicates.count(op) || op == "pbvcomp")
  {
    return op.substr(1);
  }
  if (op == "pconcat") return "concat";
  return op;
}

bool is_pbv_sort(const SP & s) { return s->is_atom && s->atom == "PBitVec"; }

// ---------------------------------------------------------------------------
// Width inference

enum NodeKind
{
  GLOBAL,
  PARAM,
  QVAR,
  UF
};

struct Binding
{
  // For a PBitVec symbol: placeholder of its width; for a let-bound PBV term:
  // the width of the term. Null for non-PBV symbols.
  SP w;
  // For a non-PBV symbol: the integer form to use when it appears in widths.
  SP iform;
};

struct Fun
{
  std::vector<int> params;  // node of each PBitVec parameter, -1 otherwise
  SP ret;                   // width of the result, null if not PBitVec
};

// Result of inferring a term: w is its width if it is a PBitVec,
// otherwise iform is the term with every (pbvsize t) replaced by t's width.
struct Res
{
  SP w;
  SP iform;
};

class Translator
{
 public:
  std::string run(const std::string & text)
  {
    std::vector<SP> cmds = Reader(text).read_all();
    for (const SP & c : cmds)
    {
      collect_atoms(c);
    }
    for (const SP & c : cmds)
    {
      infer_command(c);
    }
    solve_equations();
    // name the widths of top-level symbols first, in declaration order,
    // so the first free width is the one called k
    for (size_t n = 0; n < kind.size(); ++n)
    {
      if (kind[n] != PARAM) resolve(find(n));
    }
    std::ostringstream body;
    for (const SP & c : cmds)
    {
      std::string line = emit_command(c);
      if (!line.empty()) body << line << "\n";
    }
    // the fresh widths must be declared before use: right after set-logic
    std::ostringstream decls;
    for (const std::string & f : fresh)
    {
      decls << "(declare-const " << f << " Int)\n";
    }
    std::string out = body.str();
    size_t at = 0;
    size_t logic = out.find("(set-logic ");
    if (logic != std::string::npos)
    {
      at = out.find('\n', logic) + 1;
    }
    out.insert(at, decls.str());
    return out;
  }

 private:
  std::unordered_set<std::string> used_atoms;
  std::vector<std::string> fresh;

  // union-find over width nodes
  std::vector<int> parent;
  std::vector<NodeKind> kind;
  std::vector<std::vector<SP>> pins;  // candidate width terms, per root
  std::vector<bool> has_nonparam;     // per root
  std::vector<int> state;             // 0 new, 1 resolving, 2 resolved
  std::vector<SP> resolved;
  std::vector<std::pair<SP, SP>> equations;

  std::unordered_map<std::string, Binding> globals;
  std::unordered_map<std::string, Fun> funs;  // define-funs with arguments
  std::unordered_map<std::string, Fun> ufs;
  std::vector<std::unordered_map<std::string, Binding>> scopes;

  void collect_atoms(const SP & e)
  {
    if (e->is_atom)
    {
      used_atoms.insert(e->atom);
      return;
    }
    for (const SP & k : e->kids) collect_atoms(k);
  }

  int new_node(NodeKind k)
  {
    int n = parent.size();
    parent.push_back(n);
    kind.push_back(k);
    pins.emplace_back();
    has_nonparam.push_back(k != PARAM);
    state.push_back(0);
    resolved.push_back(nullptr);
    return n;
  }

  int find(int n)
  {
    while (parent[n] != n)
    {
      parent[n] = parent[parent[n]];
      n = parent[n];
    }
    return n;
  }

  void merge(int a, int b)
  {
    a = find(a);
    b = find(b);
    if (a == b) return;
    // keep the older node as the root: it names the class
    if (b < a) std::swap(a, b);
    parent[b] = a;
    pins[a].insert(pins[a].end(), pins[b].begin(), pins[b].end());
    pins[b].clear();
    has_nonparam[a] = has_nonparam[a] || has_nonparam[b];
  }

  // a and b must have the same width
  void unify(const SP & a, const SP & b)
  {
    if (!a || !b) return;
    if (is_placeholder(a) && is_placeholder(b))
    {
      merge(a->node, b->node);
    }
    else if (is_placeholder(a))
    {
      pins[find(a->node)].push_back(b);
    }
    else if (is_placeholder(b))
    {
      pins[find(b->node)].push_back(a);
    }
    else if (!a->local && !b->local)
    {
      equations.push_back({ a, b });
    }
  }

  // the class contains a declared constant
  bool has_nonparam_global(int root)
  {
    for (size_t n = 0; n < kind.size(); ++n)
    {
      if (kind[n] == GLOBAL && find(n) == root) return true;
    }
    return false;
  }

  bool pinned(int root) const
  {
    for (const SP & p : pins[root])
    {
      if (!p->local) return true;
    }
    return false;
  }

  // the width term with each placeholder replaced by the atom #<root>
  SP with_roots(const SP & e)
  {
    if (is_placeholder(e)) return mk_atom("#" + std::to_string(find(e->node)));
    if (e->is_atom) return e;
    std::vector<SP> kids;
    for (const SP & k : e->kids) kids.push_back(with_roots(k));
    return mk_list(kids);
  }

  // Use the equations between composite widths, e.g.
  // w(x) + w(s) = w(tx) + w(ts) from (pbvsge (pconcat x s) (pconcat tx ts)),
  // to fix widths the union-find left open: solve for an unpinned class
  // with coefficient 1 or -1 in a linear equation. Each equation is used
  // once; afterwards it holds by construction.
  void solve_equations()
  {
    std::vector<bool> used(equations.size(), false);
    bool progress = true;
    while (progress)
    {
      progress = false;
      for (size_t e = 0; e < equations.size(); ++e)
      {
        if (used[e]) continue;
        const auto & eq = equations[e];
        std::map<std::string, long long> coef;
        long long c = 0;
        linear(with_roots(eq.first), 1, coef, c);
        linear(with_roots(eq.second), -1, coef, c);
        int target = -1;
        long long tcoef = 0;
        bool nonlinear_width = false;
        for (const auto & kv : coef)
        {
          if (kv.second == 0) continue;
          if (kv.first[0] == '#')
          {
            int r = std::stoi(kv.first.substr(1));
            // prefer quantified variables and parameters, then the class
            // declared last: earlier declarations name the widths
            auto better = [&](int a, int b) {
              if (b < 0) return true;
              bool la = has_nonparam_global(a), lb = has_nonparam_global(b);
              return la != lb ? lb : a > b;
            };
            if (!pinned(r) && (kv.second == 1 || kv.second == -1)
                && better(r, target))
            {
              target = r;
              tcoef = kv.second;
            }
          }
          else if (kv.first.find('#') != std::string::npos)
          {
            nonlinear_width = true;
          }
        }
        if (target < 0 || nonlinear_width) continue;
        // tcoef * target + rest = 0  =>  target = -tcoef * rest
        std::vector<SP> pos, neg;
        auto term = [&](long long v, const SP & a) {
          SP t = v == 1 || v == -1
                     ? a
                     : mk_list({ mk_atom("*"),
                                 mk_atom(std::to_string(v < 0 ? -v : v)),
                                 a });
          (v > 0 ? pos : neg).push_back(t);
        };
        for (const auto & kv : coef)
        {
          long long v = -tcoef * kv.second;
          if (v == 0 || kv.first == "#" + std::to_string(target)) continue;
          SP a = kv.first[0] == '#' ? mk_placeholder(std::stoi(kv.first.substr(1)))
                                    : mk_atom(kv.first);
          term(v, a);
        }
        long long k = -tcoef * c;
        if (k != 0) term(k > 0 ? 1 : -1, mk_atom(std::to_string(k > 0 ? k : -k)));
        SP sum;
        if (pos.empty()) pos.push_back(mk_atom("0"));
        sum = pos.size() == 1 ? pos[0] : nullptr;
        if (!sum)
        {
          std::vector<SP> kids = { mk_atom("+") };
          kids.insert(kids.end(), pos.begin(), pos.end());
          sum = mk_list(kids);
        }
        if (!neg.empty())
        {
          std::vector<SP> kids = { mk_atom("-"), sum };
          kids.insert(kids.end(), neg.begin(), neg.end());
          sum = mk_list(kids);
        }
        if (is_placeholder(sum)) merge(target, sum->node);
        else pins[target].push_back(sum);
        used[e] = true;
        progress = true;
      }
    }
  }

  const Binding * lookup(const std::string & name) const
  {
    for (auto it = scopes.rbegin(); it != scopes.rend(); ++it)
    {
      auto f = it->find(name);
      if (f != it->end()) return &f->second;
    }
    auto g = globals.find(name);
    return g == globals.end() ? nullptr : &g->second;
  }

  // integer form of a symbol bound inside a define-fun or a quantifier
  static SP local_atom(const std::string & name)
  {
    SP a = mk_atom(name);
    a->local = true;
    return a;
  }

  // bind the variables of a sorted list ((x S) ...) in the current scope
  void bind_sorted_vars(const SP & list, NodeKind k)
  {
    for (const SP & pair : list->kids)
    {
      if (pair->is_atom || pair->kids.size() != 2)
      {
        throw std::runtime_error("bad sorted variable: " + to_string(pair));
      }
      const std::string & name = pair->kids[0]->atom;
      if (is_pbv_sort(pair->kids[1]))
      {
        pair->node = new_node(k);
        scopes.back()[name] = { mk_placeholder(pair->node), nullptr };
      }
      else
      {
        scopes.back()[name] = { nullptr, local_atom(name) };
      }
    }
  }

  Res infer(const SP & e)
  {
    if (e->is_atom)
    {
      if (const Binding * b = lookup(e->atom))
      {
        return { b->w, b->iform };
      }
      return { nullptr, e };
    }
    if (e->kids.empty()) return { nullptr, e };

    const SP & head = e->kids[0];
    if (!head->is_atom)
    {
      std::vector<SP> kids;
      for (const SP & k : e->kids) kids.push_back(infer(k).iform);
      return { nullptr, mk_list(kids) };
    }
    const std::string & h = head->atom;
    size_t n = e->kids.size() - 1;
    auto arg = [&](size_t i) { return e->kids[i + 1]; };
    auto need = [&](size_t count) {
      if (n != count)
      {
        throw std::runtime_error(h + " expects " + std::to_string(count)
                                 + " arguments: " + to_string(e));
      }
    };
    auto pbv = [&](const SP & t) {
      Res r = infer(t);
      if (!r.w)
      {
        throw std::runtime_error("expected a PBitVec term in " + to_string(e));
      }
      return r.w;
    };

    if (h == "let")
    {
      need(2);
      std::unordered_map<std::string, Binding> binds;
      for (const SP & b : arg(0)->kids)
      {
        Res r = infer(b->kids[1]);
        binds[b->kids[0]->atom] = { r.w, r.iform };
      }
      scopes.push_back(binds);
      Res r = infer(arg(1));
      scopes.pop_back();
      return r;
    }
    if (h == "forall" || h == "exists")
    {
      need(2);
      scopes.emplace_back();
      bind_sorted_vars(arg(0), QVAR);
      infer(arg(1));
      scopes.pop_back();
      return { nullptr, local_atom(to_string(e)) };
    }
    if (h == "!")
    {
      return infer(arg(0));
    }
    if (h == "pbvsize")
    {
      need(1);
      e->width = pbv(arg(0));
      return { nullptr, e->width };
    }
    if (h == "int_to_pbv")
    {
      need(2);
      Res w = infer(arg(0));
      infer(arg(1));
      return { w.iform, nullptr };
    }
    if (h == "pextract")
    {
      need(3);
      pbv(arg(0));
      SP hi = infer(arg(1)).iform;
      SP lo = infer(arg(2)).iform;
      return { mk_list({ mk_atom("+"), mk_list({ mk_atom("-"), hi, lo }),
                         mk_atom("1") }),
               nullptr };
    }
    if (h == "pzero_extend" || h == "psign_extend")
    {
      need(2);
      SP ext = infer(arg(0)).iform;
      SP w = pbv(arg(1));
      return { mk_list({ mk_atom("+"), ext, w }), nullptr };
    }
    if (h == "pconcat")
    {
      std::vector<SP> sum = { mk_atom("+") };
      for (size_t i = 0; i < n; ++i) sum.push_back(pbv(arg(i)));
      return { mk_list(sum), nullptr };
    }
    if (same_width_ops.count(h) || predicates.count(h) || h == "pbvcomp")
    {
      SP w = pbv(arg(0));
      for (size_t i = 1; i < n; ++i) unify(w, pbv(arg(i)));
      if (same_width_ops.count(h)) return { w, nullptr };
      if (h == "pbvcomp") return { mk_atom("1"), nullptr };
      return { nullptr, local_atom(to_string(e)) };
    }
    if (h == "=" || h == "distinct" || h == "ite")
    {
      std::vector<Res> rs;
      for (size_t i = 0; i < n; ++i) rs.push_back(infer(arg(i)));
      // for ite the condition is not part of the same-width group
      size_t first = h == "ite" ? 1 : 0;
      SP w;
      for (size_t i = first; i < rs.size(); ++i)
      {
        if (!rs[i].w) continue;
        if (w) unify(w, rs[i].w);
        else w = rs[i].w;
      }
      if (w && h == "ite") return { w, nullptr };
      std::vector<SP> kids = { head };
      for (const Res & r : rs) kids.push_back(r.iform);
      return { nullptr, mk_list(kids) };
    }

    auto fit = funs.find(h);
    auto uit = ufs.find(h);
    if (!lookup(h) && (fit != funs.end() || uit != ufs.end()))
    {
      const Fun & f = fit != funs.end() ? fit->second : uit->second;
      if (f.params.size() != n)
      {
        throw std::runtime_error(h + " applied to " + std::to_string(n)
                                 + " arguments: " + to_string(e));
      }
      std::vector<SP> kids = { head };
      for (size_t i = 0; i < n; ++i)
      {
        Res r = infer(arg(i));
        if (f.params[i] >= 0) unify(mk_placeholder(f.params[i]), r.w);
        kids.push_back(r.iform);
      }
      if (f.ret) return { f.ret, nullptr };
      return { nullptr, mk_list(kids) };
    }

    // an operator over integers or Booleans
    std::vector<SP> kids = { head };
    for (size_t i = 0; i < n; ++i) kids.push_back(infer(arg(i)).iform);
    return { nullptr, mk_list(kids) };
  }

  // a top-level (assert (= (pbvsize x) N)) fixes the width of x
  void pin_from_assertion(const SP & f)
  {
    if (!f || f->is_atom || f->kids.empty() || !f->kids[0]->is_atom) return;
    const std::string & h = f->kids[0]->atom;
    if (h == "and")
    {
      for (size_t i = 1; i < f->kids.size(); ++i) pin_from_assertion(f->kids[i]);
    }
    else if (h == "=")
    {
      for (size_t i = 1; i < f->kids.size(); ++i)
      {
        for (size_t j = 1; j < f->kids.size(); ++j)
        {
          const SP & a = f->kids[i];
          const SP & b = f->kids[j];
          if (i != j && a && b && is_placeholder(a) && !b->local)
          {
            unify(a, b);
          }
        }
      }
    }
  }

  void infer_command(const SP & c)
  {
    if (c->is_atom || c->kids.empty() || !c->kids[0]->is_atom) return;
    const std::string & h = c->kids[0]->atom;
    if (h == "declare-const" || (h == "declare-fun" && c->kids.size() == 4
                                 && c->kids[2]->kids.empty()))
    {
      const std::string & name = c->kids[1]->atom;
      const SP & sort = c->kids.back();
      if (is_pbv_sort(sort))
      {
        c->node = new_node(GLOBAL);
        globals[name] = { mk_placeholder(c->node), nullptr };
      }
      else
      {
        globals[name] = { nullptr, c->kids[1] };
      }
    }
    else if (h == "declare-fun")
    {
      Fun f;
      for (const SP & s : c->kids[2]->kids)
      {
        if (is_pbv_sort(s)) s->node = new_node(UF);
        f.params.push_back(s->node);
      }
      const SP & ret = c->kids[3];
      if (is_pbv_sort(ret))
      {
        ret->node = new_node(UF);
        f.ret = mk_placeholder(ret->node);
      }
      ufs[c->kids[1]->atom] = f;
    }
    else if (h == "define-fun")
    {
      const std::string & name = c->kids[1]->atom;
      const SP & params = c->kids[2];
      scopes.emplace_back();
      bind_sorted_vars(params, PARAM);
      Res r = infer(c->kids[4]);
      scopes.pop_back();
      if (is_pbv_sort(c->kids[3]))
      {
        if (!r.w)
        {
          throw std::runtime_error("body of " + name + " is not a PBitVec");
        }
        c->width = r.w;
      }
      if (params->kids.empty())
      {
        globals[name] = { r.w, r.iform };
      }
      else
      {
        Fun f;
        for (const SP & p : params->kids) f.params.push_back(p->node);
        f.ret = r.w;
        funs[name] = f;
      }
    }
    else if (h == "assert")
    {
      pin_from_assertion(infer(c->kids[1]).iform);
    }
    else if (h == "check-sat-assuming" || h == "get-value")
    {
      for (const SP & t : c->kids[1]->kids) infer(t);
    }
  }

  // -------------------------------------------------------------------------
  // Resolving widths to terms

  std::string fresh_name()
  {
    for (size_t i = 0;; ++i)
    {
      std::string name = i ? "k" + std::to_string(i) : "k";
      if (!used_atoms.count(name))
      {
        used_atoms.insert(name);
        fresh.push_back(name);
        return name;
      }
    }
  }

  // replace placeholders by the resolved widths; null if there is a cycle
  SP substitute(const SP & e)
  {
    if (is_placeholder(e)) return resolve(find(e->node));
    if (e->is_atom) return e;
    std::vector<SP> kids;
    for (const SP & k : e->kids)
    {
      SP s = substitute(k);
      if (!s) return nullptr;
      kids.push_back(s);
    }
    return mk_list(kids);
  }

  static int rank(const SP & pin)
  {
    if (has_placeholder(pin)) return 2;
    return is_numeral(simplify(pin)->atom) ? 0 : 1;
  }

  SP resolve(int root)
  {
    if (state[root] == 2) return resolved[root];
    if (state[root] == 1) return nullptr;
    state[root] = 1;
    std::vector<SP> cands;
    for (const SP & p : pins[root])
    {
      if (!p->local) cands.push_back(p);
    }
    std::stable_sort(cands.begin(), cands.end(), [](const SP & a, const SP & b) {
      return rank(a) < rank(b);
    });
    SP res;
    for (const SP & p : cands)
    {
      if ((res = substitute(p)))
      {
        res = simplify(res);
        break;
      }
    }
    if (!res)
    {
      // a class of parameters only belongs to a define-fun that is never
      // applied; its width is irrelevant, so do not introduce a new constant
      if (!has_nonparam[root] && !fresh.empty()) res = mk_atom(fresh[0]);
      else res = mk_atom(fresh_name());
    }
    resolved[root] = res;
    state[root] = 2;
    return res;
  }

  // Linear normal form: c + sum coef[atom] * atom, where non-linear
  // subterms are atoms.
  static void linear(const SP & e,
                     long long mult,
                     std::map<std::string, long long> & coef,
                     long long & c)
  {
    if (e->is_atom)
    {
      if (is_numeral(e->atom)) c += mult * std::stoll(e->atom);
      else coef[e->atom] += mult;
      return;
    }
    const std::string h =
        !e->kids.empty() && e->kids[0]->is_atom ? e->kids[0]->atom : "";
    size_t n = e->kids.size() - 1;
    if (h == "+" && n >= 1)
    {
      for (size_t i = 1; i <= n; ++i) linear(e->kids[i], mult, coef, c);
      return;
    }
    if (h == "-" && n >= 1)
    {
      if (n == 1)
      {
        linear(e->kids[1], -mult, coef, c);
        return;
      }
      linear(e->kids[1], mult, coef, c);
      for (size_t i = 2; i <= n; ++i) linear(e->kids[i], -mult, coef, c);
      return;
    }
    if (h == "*" && n >= 1)
    {
      // linear only if at most one factor is not a constant
      long long factor = 1;
      std::vector<SP> rest;
      for (size_t i = 1; i <= n; ++i)
      {
        SP s = simplify(e->kids[i]);
        if (s->is_atom && is_numeral(s->atom)) factor *= std::stoll(s->atom);
        else rest.push_back(e->kids[i]);
      }
      if (rest.empty())
      {
        c += mult * factor;
        return;
      }
      if (rest.size() == 1)
      {
        linear(rest[0], mult * factor, coef, c);
        return;
      }
    }
    coef[to_string(e)] += mult;
  }

  // Fold a width term that is a constant or a single symbol; keep any other
  // term as written so it matches the ALL encoding.
  static SP simplify(const SP & e)
  {
    if (e->is_atom) return e;
    std::map<std::string, long long> coef;
    long long c = 0;
    linear(e, 1, coef, c);
    std::string single;
    size_t nonzero = 0;
    for (const auto & kv : coef)
    {
      if (kv.second == 0) continue;
      ++nonzero;
      if (kv.second == 1) single = kv.first;
    }
    if (nonzero == 0)
    {
      if (c >= 0) return mk_atom(std::to_string(c));
      return mk_list({ mk_atom("-"), mk_atom(std::to_string(-c)) });
    }
    if (nonzero == 1 && c == 0 && !single.empty() && single[0] != '(')
    {
      return mk_atom(single);
    }
    return e;
  }

  std::string bv_sort(const SP & w)
  {
    return "(_ BitVec " + to_string(simplify(substitute(w))) + ")";
  }

  std::string node_sort(int node) { return bv_sort(mk_placeholder(node)); }

  // -------------------------------------------------------------------------
  // Emitting the ALL encoding

  std::string emit_sorted_vars(const SP & list)
  {
    std::string s = "(";
    for (size_t i = 0; i < list->kids.size(); ++i)
    {
      const SP & pair = list->kids[i];
      if (i) s += " ";
      s += "(" + pair->kids[0]->atom + " "
           + (pair->node >= 0 ? node_sort(pair->node) : emit(pair->kids[1]))
           + ")";
    }
    return s + ")";
  }

  std::string emit(const SP & e)
  {
    if (e->is_atom)
    {
      return e->node >= 0 ? node_sort(e->node) : e->atom;
    }
    if (!e->kids.empty() && e->kids[0]->is_atom)
    {
      const std::string & h = e->kids[0]->atom;
      if (h == "pbvsize")
      {
        return to_string(simplify(substitute(e->width)));
      }
      if (h == "pextract" && e->kids.size() == 4)
      {
        return "(pextract " + emit(e->kids[2]) + " " + emit(e->kids[3]) + " "
               + emit(e->kids[1]) + ")";
      }
      if (h == "forall" || h == "exists")
      {
        return "(" + h + " " + emit_sorted_vars(e->kids[1]) + " "
               + emit(e->kids[2]) + ")";
      }
    }
    std::string s = "(";
    for (size_t i = 0; i < e->kids.size(); ++i)
    {
      if (i) s += " ";
      const SP & k = e->kids[i];
      s += i == 0 && k->is_atom && k->node < 0 ? rename_op(k->atom) : emit(k);
    }
    return s + ")";
  }

  // (= a b ...) whose arguments are the same term once widths are resolved,
  // such as (= (pbvsize x) 32) when x has the width 32
  bool is_tautology(const SP & f)
  {
    if (f->is_atom || f->kids.size() < 3 || !f->kids[0]->is_atom
        || f->kids[0]->atom != "=")
    {
      return false;
    }
    bool width = false;
    std::string first = emit(f->kids[1]);
    for (size_t i = 1; i < f->kids.size(); ++i)
    {
      const SP & a = f->kids[i];
      width = width || (!a->is_atom && !a->kids.empty() && a->kids[0]->is_atom
                        && a->kids[0]->atom == "pbvsize");
      if (emit(a) != first) return false;
    }
    return width;
  }

  std::string emit_command(const SP & c)
  {
    if (c->is_atom || c->kids.empty() || !c->kids[0]->is_atom) return emit(c);
    const std::string & h = c->kids[0]->atom;
    if (h == "set-logic") return "(set-logic ALL)";
    if (h == "assert" && is_tautology(c->kids[1])) return "";
    if (h == "declare-const" && c->node >= 0)
    {
      return "(declare-const " + c->kids[1]->atom + " " + node_sort(c->node)
             + ")";
    }
    if (h == "declare-fun" && c->node >= 0)
    {
      return "(declare-fun " + c->kids[1]->atom + " () " + node_sort(c->node)
             + ")";
    }
    if (h == "define-fun")
    {
      std::string ret =
          c->width ? bv_sort(c->width) : emit(c->kids[3]);
      return "(define-fun " + c->kids[1]->atom + " "
             + emit_sorted_vars(c->kids[2]) + " " + ret + " "
             + emit(c->kids[4]) + ")";
    }
    if (h == "declare-fun" || h == "declare-const" || h == "set-info"
        || h == "set-option")
    {
      // sorts are emitted through their node, keywords as written
      std::string s = "(";
      for (size_t i = 0; i < c->kids.size(); ++i)
      {
        if (i) s += " ";
        s += emit(c->kids[i]);
      }
      return s + ")";
    }
    return emit(c);
  }
};

}  // namespace

bool is_pbv_logic_file(const std::string & path)
{
  std::ifstream in(path);
  if (!in) return false;
  std::stringstream ss;
  ss << in.rdbuf();
  std::vector<SP> cmds;
  try
  {
    cmds = Reader(ss.str()).read_all();
  }
  catch (const std::runtime_error &)
  {
    return false;
  }
  for (const SP & c : cmds)
  {
    if (!c->is_atom && c->kids.size() == 2 && c->kids[0]->is_atom
        && c->kids[0]->atom == "set-logic")
    {
      return c->kids[1]->atom == "PBV";
    }
  }
  return false;
}

std::string pbv_to_all(const std::string & text)
{
  return Translator().run(text);
}

void pbv_file_to_all(const std::string & in_path, const std::string & out_path)
{
  std::ifstream in(in_path);
  if (!in) throw std::runtime_error("Unable to open the file: " + in_path);
  std::stringstream ss;
  ss << in.rdbuf();
  std::string all = pbv_to_all(ss.str());
  std::ofstream out(out_path);
  if (!out) throw std::runtime_error("Unable to create the file: " + out_path);
  out << all;
}

}  // namespace pbv
