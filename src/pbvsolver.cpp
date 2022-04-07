#include "pbvsolver.h"
// #include <typeinfo>

using namespace std;

template<typename Base, typename T>
inline bool instanceof(const T*) {
   return is_base_of<Base, T>::value;
}

namespace smt {

    PBVSolver::PBVSolver(SmtSolver s) : AbsSmtSolver(s->get_solver_enum()),
      wrapped_solver(s) {
        // term_rules = new TermVec();
        // operator_rules = new TermVec();
          Sort intsort = s->make_sort(INT);
          Sort uninterpetd_function = s->make_sort(FUNCTION, SortVec{ intsort, intsort});
        //   this->power2 = s->make_symbol("power2", uninterpetd_function);
    }

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
        Term pbvt = std::make_shared<PBVTerm>(name, s);
        return pbvt;
    }

    Term PBVSolver::make_term(const Op op, const Term & t0, const Term & t1) const {
        if (t0->is_pbvterm() || t1->is_pbvterm()) {
            Sort s = compute_sort(op, this, {t0->get_sort(), t1->get_sort()});
            Term pbvt = std::make_shared<PBVTerm>(s, op, TermVec{t0, t1});
            return pbvt;
        }
        return wrapped_solver->make_term(op, t0, t1);
    }

    void PBVSolver::assert_formula(const Term & t) {
        Term res = translate_term(t);
        wrapped_solver->assert_formula(res);
      }

    Term PBVSolver::translate_term( const Term & t) {
        // PBVConstantWalker* walker = new PBVConstantWalker(wrapped_solver);
        PBVWalker* walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        Term& t1 = const_cast<Term&>(t); // todo: add const to Walker->visit.
        Term res = walker->visit(t1);
        // res /\ set rules
        for (Term r : term_rules) {
            // cout << r << endl;
            res = wrapped_solver->make_term(And, res, r);
        }
        for (Term r : operator_rules) {
            // cout << r << endl;
            res = wrapped_solver->make_term(And, res, r);
        }
        cout << "original term: " << t << endl;
        cout << "translate term: " << res << endl;
        return res;
    }


// PBVWalker function
Term PBVWalker::make_bit_width_term(TermIter it) {
    Sort s_left = (*it)->get_sort();
    shared_ptr<PBVSort> pbvs_left = static_pointer_cast<PBVSort>(s_left);
    Term width_left = pbvs_left->get_term();
    it++;
    Sort s_right = (*it)->get_sort();
    shared_ptr<PBVSort> pbvs_right = static_pointer_cast<PBVSort>(s_right);
    Term width_right = pbvs_right->get_term();
    Term bitWidth = solver_->make_term(Equal, width_left, width_right);
    // cout << bitWidth << endl;
    return bitWidth;
}

Term PBVWalker::get_bit_width_term(TermIter it) {
    Sort s = (*it)->get_sort();
    shared_ptr<PBVSort> pbvs = static_pointer_cast<PBVSort>(s);
    Term width = pbvs->get_term();
    return width;
}



Term PBVWalker::make_Integer_term(Op op, TermIter it) {
    Term t1 = *it;
    it++;
    Term t2 = *it;
    return solver_->make_term(op, t1, t2);
}

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
      // convert bv operator to int operator.
      Op int_op = op;
      Term int_term;
      Term bit_width;
      if(term->is_pbvterm()) {
            auto it = term->begin();
            PrimOp primop = op.prim_op;

            switch (primop) {
                case Equal: { operator_rules->push_back(make_bit_width_term(it));
                            } break;
                case Distinct: { operator_rules->push_back(make_bit_width_term(it));
                            } break;
                case BVAdd: { int_op = Mod;
                            bit_width = get_bit_width_term(it);
                            operator_rules->push_back(make_bit_width_term(it));
                            int_term = solver_->make_term(Plus, cached_children);
                            } break;
                case BVSub: { int_op = Mod;
                            bit_width = get_bit_width_term(it);
                            operator_rules->push_back(make_bit_width_term(it));
                            int_term = solver_->make_term(Minus, cached_children);
                            } break;
                case BVMul: { int_op = Mod;
                            bit_width = get_bit_width_term(it);
                            operator_rules->push_back(make_bit_width_term(it));
                            int_term = solver_->make_term(Mult, cached_children);
                            } break;
                case BVUdiv: { int_op = Ite;
                            // bit_width = get_bit_width_term(it);
                            // operator_rules->push_back(make_bit_width_term(it));
                            // cout << 1 << endl;

                            // Term y = ////

                            // Sort intsort = solver_->make_sort(INT);
                            // Term zero =  solver_->make_term(0, intsort);
                            // Term condition = solver_->make_term(Equal, y, zero);
                            // Term power2_k = solver_->make_term(Pow, this->two, bit_width);
                            // Term one =  solver_->make_term(1, intsort);
                            // Term then_branch = solver_->make_term(Minus, power2_k, one);
                            // Term else_branch = solver_->make_term(Div, cached_children);
                            // Term ite = solver_->make_term(Ite, condition, then_branch, else_branch);
                            // save_in_cache(term, ite);
                            } break;
                case Concat: { Sort s1 = (*it)->get_sort();
                             shared_ptr<PBVSort> pbvs1 = static_pointer_cast<PBVSort>(s1);
                             Term t1 = pbvs1->get_term();
                             it++;
                             Sort s2 = (*it)->get_sort();
                             shared_ptr<PBVSort> pbvs2 = static_pointer_cast<PBVSort>(s2);
                             Term t2 = pbvs1->get_term();
                             Term width_left = solver_->make_term(Plus, t1, t2);
                             it++;
                             Sort s_right = (*it)->get_sort();
                             shared_ptr<PBVSort> pbvs_right = static_pointer_cast<PBVSort>(s_right);
                             Term width_right = pbvs_right->get_term();
                             Term bitWidth = solver_->make_term(Equal, width_left, width_right);
                             operator_rules->push_back(bitWidth);
                            } break;
                            /// bvand mod
                default: break;
            }
      }
      // mod
      if (int_op ==  Mod) {
        Term power2_k = solver_->make_term(Pow, this->two, bit_width);
        save_in_cache(term, solver_->make_term(Mod, int_term, power2_k));
      } else if (int_op == op) {
        save_in_cache(term, solver_->make_term(int_op, cached_children));
      }
    }
    else
    {
     Term res;
      // change bv, k ---> integer, k
      if(term->is_pbvterm()) {
        Sort intsort = solver_->make_sort(INT);
        Term k = solver_->make_symbol("_pbv_" + term->to_string() ,intsort);
        res = k;
        // 0 <= k <= pow2(k)
        Term zero =  solver_->make_term(0, intsort);
        Term ge = solver_->make_term(Ge, k, zero);
        term_rules->push_back(ge);
        Sort pbv_sort = term->get_sort();
        shared_ptr<PBVSort> bv_sort = static_pointer_cast<PBVSort>(pbv_sort);
        Term bit_width = bv_sort->get_term();
        Term power2_k = solver_->make_term(Pow, this->two, bit_width);
        Term lt = solver_->make_term(Lt, k, power2_k);
        term_rules->push_back(lt);
        // for (Term r : *term_rules) {
        //    cout << r << endl; 
        // }
      } else {
          res = term;
      }
      save_in_cache(term, res);
    }
  }
return Walker_Continue;
}

// PBVConstantWalker function

WalkerStepResult PBVConstantWalker::visit_term(Term & term) {
  if (!preorder_)
  {
    bool is_pbv = false;
    Op op = term->get_op();
    if (!op.is_null())
    {
      TermVec cached_children;
      Term c;
      for (auto t : term)
      {
        if(t->is_pbvterm()) {
            is_pbv = true;
        }
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
      if(term->is_pbvterm()) {
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

