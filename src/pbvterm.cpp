#include "pbvterm.h"
#include "utils.h"


using namespace std;

namespace smt {

PBVTerm::PBVTerm(Sort s1, TermVec t) : s(s1), children(t) {
    is_sym = false;
    op = Op();
    for (auto term : t)
    {
      auto it = term->begin();
      repr = (*it)->to_string();
      break;
    }
    is_pbv = true;
}

PBVTerm::PBVTerm(Term t) {
  s = t->get_sort();
  children = {t};
  is_sym = false;
  op = Op();
  for (auto term : t)
    {
      auto it = term->begin();
      repr = (*it)->to_string();
      break;
  }
  is_pbv = true;
}

PBVTerm::PBVTerm(Sort s1, Op op1, TermVec t) : s(s1), children(t), op(op1) {
    is_sym = false;
    repr = compute_string();
    is_pbv = true;
}

PBVTerm::PBVTerm(std::string name, TermVec t) : repr(name), children(t) {
    s = t[0]->get_sort();
    is_sym = true;
    op = Op();
    is_pbv = true;
}

PBVTerm::PBVTerm(std::string name, Sort s1) : repr(name), s(s1) {
    is_sym = true;
    op = Op();
    is_pbv = true;
}

PBVTerm::PBVTerm(Op op1, TermVec t) : op(op1), children(t) {
    s = t[0]->get_sort();
    is_sym = false;
    repr = compute_string();
    is_pbv = true;
}




  bool PBVTerm::is_param() const {
    throw NotImplementedException("is_param() not implemented by default");
  }
  bool PBVTerm::is_symbolic_const() const {
    throw NotImplementedException("is_symbolic_const() not implemented by default");
  }
  bool PBVTerm::is_value() const {
    try {
      if (stoi(repr) >= 0) {
        return true;
      }
    }
    catch (...) {
      return false;
    }
  }

  uint64_t PBVTerm::to_int() const {
    return stoi(repr);
  }
  std::string PBVTerm::print_value_as(SortKind sk) {
    throw NotImplementedException("print_value_as() not implemented by default");
  }

Sort PBVTerm::get_sort() const { return s; }
Op PBVTerm::get_op() const { 
  if (repr.substr(1, 3) == "div") {
    return IntDiv;
  }
  return op; 
}

bool PBVTerm::is_symbol() const { return is_sym; }
size_t PBVTerm::hash() const { return str_hash(compute_string()); }
std::size_t PBVTerm::get_id() const { return id_; }


bool PBVTerm::compare(const Term & t) const
{
  // TODO: not efficient.
  if (!t)
  {
    // The null term is different than any constructed term.
    return false;
  }
  // cout << "repr:" + repr << endl << "t->to_string(): " + t->to_string() << endl;
  return repr == t->to_string();
}

string PBVTerm::to_string()
{
  if (repr.empty())
  {
    repr = compute_string();
  }
  return repr;
}

string PBVTerm::compute_string() const
{
  if (!repr.empty())
  {
    return repr;
  }
  // Assert(!op.is_null());
    string result = "(";
    result += op.to_string();
    for (auto c : children)
    {
      result += " " + c->to_string();
   }
    result += ")";
  return result;
}

TermIter PBVTerm::begin()
{
  return TermIter(new PBVTermIter(children.begin()));
}

TermIter PBVTerm::end()
{
  return TermIter(new PBVTermIter(children.end()));
}
/* PBVTermIter */

PBVTermIter::PBVTermIter(TermVec::iterator i) : it(i) {}

PBVTermIter::PBVTermIter(const PBVTermIter & pbvit) : it(pbvit.it) {}

PBVTermIter::~PBVTermIter() {}

PBVTermIter & PBVTermIter::operator=(const PBVTermIter & pbvit)
{
  it = pbvit.it;
  return *this;
}

void PBVTermIter::operator++() { it++; }

const Term PBVTermIter::operator*() { return *it; }

TermIterBase * PBVTermIter::clone() const
{
  return new PBVTermIter(it);
}

bool PBVTermIter::operator==(const PBVTermIter & pbvit)
{
  return it == pbvit.it;
}

bool PBVTermIter::operator!=(const PBVTermIter & pbvit)
{
  return it != pbvit.it;
}

bool PBVTermIter::equal(const TermIterBase & other) const
{
  const PBVTermIter & pbvit = static_cast<const PBVTermIter &>(other);
  return it == pbvit.it;
}

}