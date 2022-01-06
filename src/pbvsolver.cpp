#include "pbvsolver.h"
// #include <typeinfo>

using namespace std;

template<typename Base, typename T>
inline bool instanceof(const T*) {
   return is_base_of<Base, T>::value;
}

namespace smt {

    PBVSolver::PBVSolver(SmtSolver s) : AbsSmtSolver(s->get_solver_enum()),
      wrapped_solver(s) {}

    // implemented
    Sort PBVSolver::make_sort(const std::string name, uint64_t arity) const {
        return wrapped_solver->make_sort(name, arity);
    }

    Sort PBVSolver::make_sort(const SortKind sk) const {
        return wrapped_solver->make_sort(sk);
    }

    Sort PBVSolver::make_sort(const SortKind sk, uint64_t size) const {
        return wrapped_solver->make_sort(sk, size);
    }

    Sort PBVSolver::make_sort(const SortKind sk, const Sort & sort1) const {
            return wrapped_solver->make_sort(sk, sort1);
    }
    
    Sort PBVSolver::make_sort(const SortKind sk,
                    const Sort & sort1,
                    const Sort & sort2) const {
                                    throw NotImplementedException("make_sort(SortKind, Sort, Sort) not implemented by default");
                    }

    Sort PBVSolver::make_sort(const SortKind sk,
                    const Sort & sort1,
                    const Sort & sort2,
                    const Sort & sort3) const {
                                    throw NotImplementedException("make_sort(SortKind, Sort, Sort, Sort) not implemented by default");
                    }

    Sort PBVSolver::make_sort(const SortKind sk, const SortVec & sorts) const {
                                    throw NotImplementedException("make_sort(SortKind, SortVec) not implemented by default");
                    }

    Sort PBVSolver::make_sort(const Sort & sort_con, const SortVec & sorts) const {
                                    throw NotImplementedException("make_sort(Sort, SortVec) not implemented by default");
                    }
    Sort PBVSolver::make_sort(const DatatypeDecl & d) const {
                                    throw NotImplementedException("make_sort(DatatypeDecl) not implemented by default");
                    }

    DatatypeDecl PBVSolver::make_datatype_decl(const std::string & s) {
                                    throw NotImplementedException("make_datatype_decl(string) not implemented by default");
                    }
    DatatypeConstructorDecl PBVSolver::make_datatype_constructor_decl(const std::string s) {
                                    throw NotImplementedException("make_datatype_constructor_decl(string) not implemented by default");
                    }
    void PBVSolver::add_constructor(DatatypeDecl & dt, const DatatypeConstructorDecl & con) const {
                                    throw NotImplementedException("add_constructor(DatatypeDecl, DatatypeConstructorDecl) not implemented by default");
                    }
    void PBVSolver::add_selector(DatatypeConstructorDecl & dt, const std::string & name, const Sort & s) const {
                                    throw NotImplementedException("add_cadd_selectoronstructor(DatatypeConstructorDecl, string, Sort) not implemented by default");
                    }
    void PBVSolver::add_selector_self(DatatypeConstructorDecl & dt, const std::string & name) const {
                                    throw NotImplementedException("add_selector_self(DatatypeConstructorDecl, string) not implemented by default");
                    }
    Term PBVSolver::get_constructor(const Sort & s, std::string name) const {
                                    throw NotImplementedException("get_constructor(Sort, string) not implemented by default");
                    }
    Term PBVSolver::get_tester(const Sort & s, std::string name) const {
                                    throw NotImplementedException("get_tester(Sort, string) not implemented by default");
                    }
    Term PBVSolver::get_selector(const Sort & s, std::string con, std::string name) const {
                                    throw NotImplementedException("get_selector(Sort, string, string) not implemented by default");
                    }

    Term PBVSolver::make_term(bool b) const {
        Term t = wrapped_solver->make_term(b);
        return t;
    }
    Term PBVSolver::make_term(int64_t i, const Sort & sort) const {
        return wrapped_solver->make_term(i, sort);
    }
    Term PBVSolver::make_term(const std::string val, const Sort & sort, uint64_t base) const {
        return wrapped_solver->make_term(val, sort, base);
    }
    Term PBVSolver::make_term(const Term & val, const Sort & sort) const {
        return wrapped_solver->make_term(val, sort);
    }
    Term PBVSolver::make_symbol(const std::string name, const Sort & sort) {
        return wrapped_solver->make_symbol(name, sort);
    }
    Term PBVSolver::get_symbol(const std::string & name) {
        return wrapped_solver->get_symbol(name);
    }
    Term PBVSolver::make_param(const std::string name, const Sort & sort) {
        return wrapped_solver->make_param(name, sort);
    }
    Term PBVSolver::make_term(const Op op, const Term & t) const {
        return wrapped_solver->make_term(op, t);
    }

    Term PBVSolver::make_term(const Op op,
                    const Term & t0,
                    const Term & t1,
                    const Term & t2) const {
        return std::make_shared<PBVTerm>(op, TermVec{t0, t1, t2});
    }
    Term PBVSolver::make_term(const Op op, const TermVec & terms) const {
        return wrapped_solver->make_term(op, terms);
    }
    Term PBVSolver::get_value(const Term & t) const {
        return wrapped_solver->get_value(t);
    }
    UnorderedTermMap PBVSolver::get_array_values(const Term & arr,
                                        Term & out_const_base) const {
        return wrapped_solver->get_array_values(arr, out_const_base);
    }
    void PBVSolver::get_unsat_assumptions(UnorderedTermSet & out) {
        return wrapped_solver->get_unsat_assumptions(out);
    }

    void PBVSolver::reset() {
        return wrapped_solver->reset();
    }

    void PBVSolver::set_opt(const std::string option, const std::string value){
        return wrapped_solver->set_opt(option, value);
    }
    void PBVSolver::set_logic(const std::string logic) {
        return wrapped_solver->set_logic(logic);
    }
    Result PBVSolver::check_sat() {
        return wrapped_solver->check_sat();
    }
    Result PBVSolver::check_sat_assuming(const TermVec & assumptions) {
        return wrapped_solver->check_sat_assuming(assumptions);
    }

    Result PBVSolver::check_sat_assuming_list(const TermList & assumptions) {
        return wrapped_solver->check_sat_assuming_list(assumptions);
    }

    Result PBVSolver::check_sat_assuming_set(const UnorderedTermSet & assumptions) {
        return wrapped_solver->check_sat_assuming_set(assumptions);
    }
    void PBVSolver::push(uint64_t num) {
        return wrapped_solver->push(num);
    }
    void PBVSolver::pop(uint64_t num) {
        return wrapped_solver->pop(num);
    }
    uint64_t PBVSolver::get_context_level() const {
        return wrapped_solver->get_context_level();
    }
    void PBVSolver::reset_assertions() {
        return wrapped_solver->reset_assertions();
    }

    // pbvsolver function
    Term PBVSolver::make_term(const Sort & pbvsort, const Term & val) const {
        Term pbvt = std::make_shared<PBVTerm>(pbvsort, TermVec{val});
        return pbvt;
    }

    Sort PBVSolver::make_sort(const SortKind sk, const Term & t) const {
        Sort s = std::make_shared<PBVSort>(BV, t);
        return s;
    }

    Term PBVSolver::make_pbv_symbol(const std::string & name, const Sort & s) const {
        // shared_ptr<PBVTerm> pbvt = static_pointer_cast<PBVTerm>(PBVTerm(name, s));
        Term pbvt = std::make_shared<PBVTerm>(name, s);
        // shared_ptr<PBVTerm> pbvt = static_pointer_cast<PBVTerm>(pbv);
        return pbvt;
    }

    Term PBVSolver::make_term(const Op op, const Term & t0, const Term & t1) const {
        Sort s = compute_sort(op, this, {t0->get_sort(), t1->get_sort()});
        Term pbvt = std::make_shared<PBVTerm>(s, op, TermVec{t0, t1});
        return pbvt;
    }

    void PBVSolver::assert_formula(const Term & t) {
        Term res = translate_term(t);
        wrapped_solver->assert_formula(res);
      }

    Term PBVSolver::translate_term( const Term & t) const {
        PBVWalker* walker = new PBVWalker(wrapped_solver);
        Term& t1 = const_cast<Term&>(t);
        Term res = walker->visit(t1);
        // cout << "translate res: " << res << endl;
        // cout << "translate t: " << t << endl;
        // cout << "translate t1: " << t1 << endl;
        return res;
    }


// PBVWalker function

WalkerStepResult PBVWalker::visit_term(Term & term) {
  if (!preorder_)
  {
    Op op = term->get_op();
    if (!op.is_null())
    {
      TermVec cached_children;
      Term c;
      for (auto t : term)
      {
        // TODO: see if we can pass the same term as both arguments
        c = t;
        query_cache(t, c);
        cached_children.push_back(c);
      }
      save_in_cache(term, solver_->make_term(op, cached_children));
    }
    else
    {
     Term res;
      // change bv, "4" ---> bv, 4
      if(term->get_id() == -1) {
        Sort s = term->get_sort();
        shared_ptr<PBVSort> pbvs = static_pointer_cast<PBVSort>(s);
        Sort bvsort = solver_->make_sort(BV, stoi(pbvs->get_term()->to_string()));
        res = solver_->make_symbol("_pbv_" + term->to_string(), bvsort);
      } else {
          res = term;
      }
      save_in_cache(term, res);
    }
  }
return Walker_Continue;
}

}  // namespace smt

