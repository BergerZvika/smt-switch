
#include "pbvsolver.h"

using namespace std;

template<typename Base, typename T>
inline bool instanceof(const T*) {
   return is_base_of<Base, T>::value;
}

namespace smt {


    AbstractPBVSolver::AbstractPBVSolver(SmtSolver s) : AbsSmtSolver(s->get_solver_enum()),
      wrapped_solver(s) {
        // term_rules = new TermVec();
        // operator_rules = new TermVec();
          Sort intsort = s->make_sort(INT);
    }

    AbstractPBVSolver::AbstractPBVSolver(SmtSolver s, int debug) : AbsSmtSolver(s->get_solver_enum()),
      wrapped_solver(s), debug(debug) {
        // term_rules = new TermVec();
        // operator_rules = new TermVec();
          Sort intsort = s->make_sort(INT);
    }

    // implemented
    Sort AbstractPBVSolver::make_sort(const std::string name, uint64_t arity) const {
        return wrapped_solver->make_sort(name, arity);
    }

    Sort AbstractPBVSolver::make_sort(const SortKind sk) const {
        return wrapped_solver->make_sort(sk);
    }

    Sort AbstractPBVSolver::make_sort(const SortKind sk, uint64_t size) const {
        return wrapped_solver->make_sort(sk, size);
    }

    Sort AbstractPBVSolver::make_sort(const SortKind sk, const Sort & sort1) const {
            return wrapped_solver->make_sort(sk, sort1);
    }
    
    Sort AbstractPBVSolver::make_sort(const SortKind sk,
                    const Sort & sort1,
                    const Sort & sort2) const {
                                    throw NotImplementedException("make_sort(SortKind, Sort, Sort) not implemented by default");
                    }

    Sort AbstractPBVSolver::make_sort(const SortKind sk,
                    const Sort & sort1,
                    const Sort & sort2,
                    const Sort & sort3) const {
                                    throw NotImplementedException("make_sort(SortKind, Sort, Sort, Sort) not implemented by default");
                    }

    Sort AbstractPBVSolver::make_sort(const SortKind sk, const SortVec & sorts) const {
                                    throw NotImplementedException("make_sort(SortKind, SortVec) not implemented by default");
                    }

    Sort AbstractPBVSolver::make_sort(const Sort & sort_con, const SortVec & sorts) const {
                                    throw NotImplementedException("make_sort(Sort, SortVec) not implemented by default");
                    }
    Sort AbstractPBVSolver::make_sort(const DatatypeDecl & d) const {
                                    throw NotImplementedException("make_sort(DatatypeDecl) not implemented by default");
                    }

    DatatypeDecl AbstractPBVSolver::make_datatype_decl(const std::string & s) {
                                    throw NotImplementedException("make_datatype_decl(string) not implemented by default");
                    }
    DatatypeConstructorDecl AbstractPBVSolver::make_datatype_constructor_decl(const std::string s) {
                                    throw NotImplementedException("make_datatype_constructor_decl(string) not implemented by default");
                    }
    void AbstractPBVSolver::add_constructor(DatatypeDecl & dt, const DatatypeConstructorDecl & con) const {
                                    throw NotImplementedException("add_constructor(DatatypeDecl, DatatypeConstructorDecl) not implemented by default");
                    }
    void AbstractPBVSolver::add_selector(DatatypeConstructorDecl & dt, const std::string & name, const Sort & s) const {
                                    throw NotImplementedException("add_cadd_selectoronstructor(DatatypeConstructorDecl, string, Sort) not implemented by default");
                    }
    void AbstractPBVSolver::add_selector_self(DatatypeConstructorDecl & dt, const std::string & name) const {
                                    throw NotImplementedException("add_selector_self(DatatypeConstructorDecl, string) not implemented by default");
                    }
    Term AbstractPBVSolver::get_constructor(const Sort & s, std::string name) const {
                                    throw NotImplementedException("get_constructor(Sort, string) not implemented by default");
                    }
    Term AbstractPBVSolver::get_tester(const Sort & s, std::string name) const {
                                    throw NotImplementedException("get_tester(Sort, string) not implemented by default");
                    }
    Term AbstractPBVSolver::get_selector(const Sort & s, std::string con, std::string name) const {
                                    throw NotImplementedException("get_selector(Sort, string, string) not implemented by default");
                    }

    Term AbstractPBVSolver::make_term(bool b) const {
        Term t = wrapped_solver->make_term(b);
        return t;
    }
    Term AbstractPBVSolver::make_term(int64_t i, const Sort & sort) const {
        return wrapped_solver->make_term(i, sort);
    }
    Term AbstractPBVSolver::make_term(const std::string val, const Sort & sort, uint64_t base) const {
        if (base == 0) {
            Term pbvt = std::make_shared<PBVTerm>(val, sort);
            return pbvt;
        }
        return wrapped_solver->make_term(val, sort, base);
    }
    Term AbstractPBVSolver::make_term(const Term & val, const Sort & sort) const {
        Sort pbvs = make_sort(BV, val);
        // return wrapped_solver->make_term(val, sort);
        // return std::make_shared<PBVTerm>(sort, TermVec{val});
        Term pbvt = std::make_shared<PBVTerm>(pbvs, TermVec{val});
        return pbvt;
    }
    Term AbstractPBVSolver::make_symbol(const std::string name, const Sort & sort) {
        if(sort->get_sort_kind() == BV) {
            return make_pbv_symbol(name, sort);
        }
        return wrapped_solver->make_symbol(name, sort);
    }
    Term AbstractPBVSolver::get_symbol(const std::string & name) {
        return wrapped_solver->get_symbol(name);
    }
    Term AbstractPBVSolver::make_param(const std::string name, const Sort & sort) {
        return wrapped_solver->make_param(name, sort);
    }
    Term AbstractPBVSolver::make_term(const Op op, const Term & t) const {
        if (t->is_pbvterm() && (op == BVNot || op == BVNeg)) {
            Sort s = t->get_sort();
            Term pbvt = std::make_shared<PBVTerm>(s, op, TermVec{t});
            return pbvt;
        }
        return wrapped_solver->make_term(op, t);
    }

    Term AbstractPBVSolver::make_term(const Op op,
                    const Term & t0,
                    const Term & t1,
                    const Term & t2) const {
        return std::make_shared<PBVTerm>(op, TermVec{t0, t1, t2});
    }
    Term AbstractPBVSolver::make_term(const Op op, const TermVec & terms) const {
        if ((*terms.begin())->is_pbvterm()) {
            Term pbvt = std::make_shared<PBVTerm>(op, terms);
            return pbvt;
        }
        return wrapped_solver->make_term(op, terms);
    }
    Term AbstractPBVSolver::get_value(const Term & t) const {
        return wrapped_solver->get_value(t);
    }
    UnorderedTermMap AbstractPBVSolver::get_array_values(const Term & arr,
                                        Term & out_const_base) const {
        return wrapped_solver->get_array_values(arr, out_const_base);
    }
    void AbstractPBVSolver::get_unsat_assumptions(UnorderedTermSet & out) {
        return wrapped_solver->get_unsat_assumptions(out);
    }

    void AbstractPBVSolver::reset() {
        return wrapped_solver->reset();
    }

    void AbstractPBVSolver::set_opt(const std::string option, const std::string value){
        return wrapped_solver->set_opt(option, value);
    }
    void AbstractPBVSolver::set_logic(const std::string logic) {
        return wrapped_solver->set_logic(logic);
    }
    Result AbstractPBVSolver::check_sat() {
          if (this->walker->clear_cache_)
            {
                this->walker->cache_.clear();

                if (this->walker->ext_cache_)
                    {
                        this->walker->ext_cache_->clear();
                    }
            }
        return wrapped_solver->check_sat();
    }
    Result AbstractPBVSolver::check_sat_assuming(const TermVec & assumptions) {
        return wrapped_solver->check_sat_assuming(assumptions);
    }

    Result AbstractPBVSolver::check_sat_assuming_list(const TermList & assumptions) {
        return wrapped_solver->check_sat_assuming_list(assumptions);
    }

    Result AbstractPBVSolver::check_sat_assuming_set(const UnorderedTermSet & assumptions) {
        return wrapped_solver->check_sat_assuming_set(assumptions);
    }
    void AbstractPBVSolver::push(uint64_t num) {
        return wrapped_solver->push(num);
    }
    void AbstractPBVSolver::pop(uint64_t num) {
        return wrapped_solver->pop(num);
    }
    uint64_t AbstractPBVSolver::get_context_level() const {
        return wrapped_solver->get_context_level();
    }
    void AbstractPBVSolver::reset_assertions() {
        return wrapped_solver->reset_assertions();
    }

    // pbvsolver function
    Term AbstractPBVSolver::make_term(const Sort & pbvsort, const Term & val) const {
        Term pbvt = std::make_shared<PBVTerm>(pbvsort, TermVec{val});
        return pbvt;
    }

    Sort AbstractPBVSolver::make_sort(const SortKind sk, const Term & t) const {
        Sort s = std::make_shared<PBVSort>(BV, t);
        return s;
    }

    Term AbstractPBVSolver::make_pbv_symbol(const std::string & name, const Sort & s) const {
        Term pbvt = std::make_shared<PBVTerm>(name, s);
        return pbvt;
    }

    Term AbstractPBVSolver::make_term(const Op op, const Term & t0, const Term & t1) const {
        if (t0->is_pbvterm() || t1->is_pbvterm()) {
            Sort s;
            if (op == Concat) {
                Sort s0 = t0->get_sort();
                shared_ptr<PBVSort> pbvs_t0 = static_pointer_cast<PBVSort>(s0);
                Term width_t0 = pbvs_t0->get_term();
                Sort s1 = t1->get_sort();
                shared_ptr<PBVSort> pbvs_t1 = static_pointer_cast<PBVSort>(s1);
                Term width_t1 = pbvs_t1->get_term();
                s = make_sort(BV, make_term(Plus, width_t0, width_t1));
            } else {
                s = compute_sort(op, this, {t0->get_sort(), t1->get_sort()});
            }
            
            Term pbvt = std::make_shared<PBVTerm>(s, op, TermVec{t0, t1});
            return pbvt;
        }
        return wrapped_solver->make_term(op, t0, t1);
    }

int postwalker;
Term AbstractPBVSolver::translate_term(const Term & t) {
        Term res, pre_res;
        postwalker = 0;
        // PBVConstantWalker* walker = new PBVConstantWalker(wrapped_solver);
        Term& t1 = const_cast<Term&>(t);
        PrePBVWalker* prewalk = new PrePBVWalker(wrapped_solver);
        Term term = prewalk->visit(t1);
        // postwalk
        if (this->postwalk) {
            postwalker = 1;
            pre_res = this->walker->visit(term);
            PostPBVWalker* postwalk = new PostPBVWalker(wrapped_solver, &operator_rules);
            res = postwalk->visit(pre_res);
        } else {
            res = this->walker->visit(term);
        }
        // res /\ set rules
        for (Term r : term_rules) {
            res = wrapped_solver->make_term(And, res, r);
        }
        for (Term r : operator_rules) {
            res = wrapped_solver->make_term(And, res, r);
        }
        if (this->debug) {
            cout << "original term: " << t << endl;
            cout << "translate term: " << res << endl;
        }
        term_rules.clear();
        operator_rules.clear();
        return res;
    }


    // pbvsolver
    PBVSolver::PBVSolver(SmtSolver s) : AbstractPBVSolver(s) {
        this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
    };
    PBVSolver::PBVSolver(SmtSolver s, int debug) : AbstractPBVSolver(s, debug) {
        this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
    };

    PBVSolver::PBVSolver(SmtSolver s, int debug, int choose_walker): AbstractPBVSolver(s, debug) {
        if (choose_walker == 0) {
            this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 1) {
            this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2); // combine
        } else if (choose_walker == 2) {
            this->walker = new FullPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 3) {
            this->walker = new PartialPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        }
    }

        PBVSolver::PBVSolver(SmtSolver s, int debug, int choose_walker, int postwalk): AbstractPBVSolver(s, debug) {
        if (choose_walker == 0) {
            this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        else if (choose_walker == 1) {
            this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 2) {
            this->walker = new FullPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 3) {
            this->walker = new PartialPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        }
        this->postwalk = postwalk;
    }



    void PBVSolver::assert_formula(const Term & t) { 
        Term res = translate_term(t);
        wrapped_solver->assert_formula(res);
    }

    // EfficientPBVSolver
    EfficientPBVSolver::EfficientPBVSolver(SmtSolver s) : AbstractPBVSolver(s) {
        this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
    };
    EfficientPBVSolver::EfficientPBVSolver(SmtSolver s, int debug) : AbstractPBVSolver(s, debug) {
        this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
    };
    void EfficientPBVSolver::assert_formula(const Term & t) {   
        Term res = translate_term(t);
        wrapped_solver->assert_formula(res);
    }


Term AbstractPBVWalker::uts(Term t) {
    Sort intsort = solver_->make_sort(INT);
    Term bit_width_term = get_bit_width_term(t);
    Term power2_k = solver_->make_term(Pow, this->two, bit_width_term);
    // translate t to _pbv_t
    Term k;
    if (!query_cache(t, k)){
            k = solver_->make_symbol("_pbv_" + t->to_string() ,intsort);
    }
    if (k->to_string() == "0") {
        return solver_->make_term(0, intsort);
    }
    // uts translate
    Term one =  solver_->make_term(1, intsort);
    Term k_minus_one = solver_->make_term(Minus, bit_width_term, one);
    Term power2_k_minus_one = solver_->make_term(Pow, this->two, k_minus_one);
    Term x_mod_power_2 = solver_->make_term(Mod, k, power2_k_minus_one);
    Term two_mul_x_mod_power_2 =  solver_->make_term(Mult, this->two, x_mod_power_2);
    return solver_->make_term(Minus, two_mul_x_mod_power_2, k);
}

Term AbstractPBVWalker::bvlshr(Term t_left, Term t_right) {
    Term bit_width = get_bit_width_term(t_left);
    Term translate_x, translate_y;
    query_cache(t_left, translate_x);
    query_cache(t_right, translate_y);
    Term power2_y = solver_->make_term(Pow, this->two, translate_y);
    Term int_term = solver_->make_term(IntDiv, translate_x , power2_y);
    Term power2_k = solver_->make_term(Pow, this->two, bit_width);
    if (postwalker) {
        return int_term;
    }
    return solver_->make_term(Mod, int_term, power2_k);
}

Term AbstractPBVWalker::bvnot(Term t) {
    Term bit_width = get_bit_width_term(t);
    Term power2_k = solver_->make_term(Pow, this->two, bit_width);
    Term translate_x;
    query_cache(t, translate_x);
    Sort intsort = solver_->make_sort(INT);
    Term one =  solver_->make_term(1, intsort);
    Term x_plus_one = solver_->make_term(Plus, translate_x, one);
    return solver_->make_term(Minus, power2_k, x_plus_one);
}

Term AbstractPBVWalker::extract(Term x, Term i, Term j) {
    Term power2_i = solver_->make_term(Pow, this->two, i);
    Term x_div_power2_i = solver_->make_term(IntDiv, x, power2_i); // x / 2^i
    Sort intsort = solver_->make_sort(INT);
    Term one =  solver_->make_term(1, intsort);
    Term j_plus_one = solver_->make_term(Plus, j, one);
    Term j_plus_one_minus_i = solver_->make_term(Minus, j_plus_one, i);
    Term power2_j_plus_one_minus_i = solver_->make_term(Pow, this->two, j_plus_one_minus_i);
    Term zero =  solver_->make_term(0, intsort);
    if (i == zero) {
        if (j == zero) {
            return solver_->make_term(Mod, x, this->two); // i = 0 && j = 0 -> x mod 2
        }
        Term power2_j_plus_one = solver_->make_term(Pow, this->two, j_plus_one);
        return solver_->make_term(Mod, x, power2_j_plus_one); // i = 0 -> x mod 2^(j+1)
    }
    return solver_->make_term(Mod, x_div_power2_i, power2_j_plus_one_minus_i); // (x / 2^i) mod 2^(j-i+1)
}

Term AbstractPBVWalker::extractSort(Term t) {
    Sort intsort = solver_->make_sort(INT);
    Sort s = t->get_sort();
    shared_ptr<PBVSort> pbvs = static_pointer_cast<PBVSort>(s);
    if (t->is_pbvterm()) {
        if (t->get_op() == Concat) {
            auto it = t->begin();
            Term t0 = (*it);
            it++;
            Term t1 = (*it);
            return solver_->make_term(Plus, extractSort(t0), extractSort(t1));
        } else if ((t->get_op()).prim_op == Extract) {
            Sort intsort = solver_->make_sort(INT);
            if ((t->get_op()).idx0 == -1 && (t->get_op()).idx1 == -1) {
                Term i, j;
                auto it = t->begin();
                i = *(++it);
                j = *(++it);
                Term one =  solver_->make_term(1, intsort);
                if (i == j) {
                    return one;
                }
                Term j_plus_one = solver_->make_term(Plus, j, one);
                return solver_->make_term(Minus, j_plus_one, i);
            }
            return solver_->make_term((t->get_op()).idx1 + 1 - (t->get_op()).idx0, intsort);
        } else {
            return pbvs->get_term();
        }
    } else {
        Term a = solver_->make_term(pbvs->get_width(), intsort); 
        return a;
    }
}

bool AbstractPBVWalker::minimum_sign(TermIter it) {
    //(bvshl (_ bv1 k) (bvsub (_ bvk k) (_ bv1 k) 
    Term left = *it;
    it++;
    Term right = *it;
    if (left->to_string() == "1" && right->get_op() == BVSub) {
         auto right_it = right->begin();
         Term left_right = *right_it;
         right_it++;
         Term right_right = *right_it;
         if (left_right->to_string() == get_bit_width_term(left_right)->to_string() && right_right->to_string() == "1") {
            return true;
         }
    }
    return false;
}

// PBVWalker function
void AbstractPBVWalker::make_bit_width_term(TermIter it) {
    Term t0 = (*it);
    it++;
    Term t1 = (*it);
    Op op0 = t0->get_op();
    Op op1 = t1->get_op();
    if ((t0->is_pbvterm() || t0->is_value()) && (t1->is_pbvterm() || t1->is_value())) {
        Term width_left = extractSort(t0);
        Term width_right = extractSort(t1);
        Term bitWidth = solver_->make_term(Equal, width_left, width_right);
        //remove duplicates rules
        for (Term rule : *operator_rules) {
            if(rule == bitWidth) {
                return;
            }
        } 
        // add leemas 
        operator_rules->push_back(bitWidth);
        // lemma: width > 0
        Sort intsort = solver_->make_sort(INT);
        Term zero =  solver_->make_term(0, intsort);
        Term greater = solver_->make_term(Gt, width_left, zero);
        operator_rules->push_back(greater);
    }
}

Term AbstractPBVWalker::get_bit_width_term(Term t) {
    Sort s;
    Op op = t->get_op();
    if (op.is_null() && (t->is_pbvterm() || t->is_value())) {
        s = t->get_sort();
        shared_ptr<PBVSort> pbvs = static_pointer_cast<PBVSort>(s);
        Term width = pbvs->get_term();
        try {
            Sort intsort = solver_->make_sort(INT);
            Term constbv = solver_->make_term(stoi(width->to_string()), intsort);
            return constbv;
        } catch (...) {
            return width;
        }
    } else {
        auto it = t->begin();
        Term left = *it;
        if (left->is_pbvterm() || left->is_value()) {
            return get_bit_width_term(left);
        }
        Term right = *(++it);
        if (right->is_pbvterm() || right->is_value()) {
            return get_bit_width_term(right);
        }
    }
}

Term PrePBVWalker::get_bit_width_term(Term t) {
    Sort s;
    Op op = t->get_op();
    if (op.is_null() && (t->is_pbvterm() || t->is_value())) {
        s = t->get_sort();
        shared_ptr<PBVSort> pbvs = static_pointer_cast<PBVSort>(s);
        Term width = pbvs->get_term();
        try {
            Sort intsort = solver_->make_sort(INT);
            Term constbv = solver_->make_term(stoi(width->to_string()), intsort);
            return constbv;
        } catch (...) {
            return width;
        }
    } else {
        auto it = t->begin();
        Term left = *it;
        if (left->is_pbvterm() || left->is_value()) {
            return get_bit_width_term(left);
        }
        Term right = *(++it);
        if (right->is_pbvterm() || right->is_value()) {
            return get_bit_width_term(right);
        }
        assert(false);
    }
}

Term AbstractPBVWalker::bvand_fullaxiom() {
    Sort intsort = solver_->make_sort(INT);
    // create axiom
    Term zero =  solver_->make_term(0, intsort);
    Term one =  solver_->make_term(1, intsort);
    Term condition = solver_->make_term(Gt,  this->k, one);
    // then
    Term k_minus_one = solver_->make_term(Minus,  this->k, one);
    Term pow2_k_minus_one = solver_->make_term(Pow, this->two, k_minus_one);
    Term x_mod_k_minus_one = solver_->make_term(Mod, this->x, pow2_k_minus_one);
    Term y_mod_k_minus_one = solver_->make_term(Mod, this->y, pow2_k_minus_one);
    Term then_branch = solver_->make_term(Apply, {this->bvand, k_minus_one, x_mod_k_minus_one, y_mod_k_minus_one});
    // else zero. ite
    Term ite = solver_->make_term(Ite, condition, then_branch, zero);
    // plus
    Term x_div_k = solver_->make_term(IntDiv, this->x, pow2_k_minus_one);
    Term x_div_k_mod_2 = solver_->make_term(Mod, x_div_k, this->two);
    Term y_div_k = solver_->make_term(IntDiv, this->y, pow2_k_minus_one);
    Term y_div_k_mod_2 = solver_->make_term(Mod, y_div_k, this->two);
    Term condition2 = solver_->make_term(Gt, y_div_k_mod_2, x_div_k_mod_2);
    Term min = solver_->make_term(Ite, condition2, x_div_k_mod_2, y_div_k_mod_2);
    Term ite_plus = solver_->make_term(Mult, min, pow2_k_minus_one);
    Term plus = solver_->make_term(Plus, ite, ite_plus);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->y});
    Term equal = solver_->make_term(Equal, ufbvand, plus);
    // forall
    Term forally = solver_->make_term(Forall, {this->y}, equal);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

Term AbstractPBVWalker::bvand_basecase() {
    Sort intsort = solver_->make_sort(INT);
    Term one =  solver_->make_term(1, intsort);
    Term x_mod_2 = solver_->make_term(Mod, this->x, this->two);
    Term y_mod_2 = solver_->make_term(Mod, this->y, this->two);
    Term condition = solver_->make_term(Gt, y_mod_2, x_mod_2);
    Term min = solver_->make_term(Ite, condition, x_mod_2, y_mod_2);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  one,  this->x,  this->y});
    Term basecase = solver_->make_term(Equal, ufbvand, min);
    Term forally = solver_->make_term(Forall, {this->y}, basecase);
    return solver_->make_term(Forall, {this->x}, forally);
}

Term AbstractPBVWalker::bvand_max() {
    Sort intsort = solver_->make_sort(INT);
    Term one =  solver_->make_term(1, intsort);
    Term k_minus_one = solver_->make_term(Minus,  this->k, one);
    Term max_k = solver_->make_term(Pow, this->two, k_minus_one);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  max_k});
    Term max = solver_->make_term(Equal, ufbvand, this->x);
    Term forallk = solver_->make_term(Forall, {this->x}, max);
    return solver_->make_term(Forall, {this->k}, forallk);
}

Term AbstractPBVWalker::bvand_min() {
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  zero});
    Term min = solver_->make_term(Equal, ufbvand, zero);
    Term forallk = solver_->make_term(Forall, {this->x}, min);
    return solver_->make_term(Forall, {this->k}, forallk);
}

Term AbstractPBVWalker::bvand_idempotence(){
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->x});
    Term idempotence = solver_->make_term(Equal, ufbvand, this->x);
    Term forallk = solver_->make_term(Forall, {this->x}, idempotence);
    return solver_->make_term(Forall, {this->k}, forallk);
}

Term AbstractPBVWalker::bvand_contradiction() {
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term one =  solver_->make_term(1, intsort);
    Term pow2_k = solver_->make_term(Pow, this->two, this->k);
    Term x_plus_one = solver_->make_term(Plus, this->x, one);
    Term not_x = solver_->make_term(Minus, pow2_k, x_plus_one);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  not_x});
    Term contradiction = solver_->make_term(Equal, ufbvand, zero);
    Term forallk = solver_->make_term(Forall, {this->x}, contradiction);
    return solver_->make_term(Forall, {this->k}, forallk);
}

Term AbstractPBVWalker::bvand_symmetry() {
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->y});
    Term symmetry_ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->y,  this->x});
    Term symmetry = solver_->make_term(Equal, ufbvand, symmetry_ufbvand);
    Term forally = solver_->make_term(Forall, {this->y}, symmetry);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

Term AbstractPBVWalker::bvand_difference() {
    Sort intsort = solver_->make_sort(INT);
    Term z = solver_->make_param("z", intsort);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  z});
    Term ufbvand_distinct_y = solver_->make_term(Distinct,  ufbvand, this->y);
    Term ufbvand2 = solver_->make_term(Apply, {this->bvand,  this->k,  this->y,  z});
    Term ufbvand2_distinct_x = solver_->make_term(Distinct,  ufbvand2, this->x);
    Term or_res = solver_->make_term(Or, ufbvand_distinct_y, ufbvand2_distinct_x);
    Term x_distinct_y = solver_->make_term(Distinct,  this->x, this->y);
    Term difference = solver_->make_term(Implies, x_distinct_y, or_res);
    Term forallz = solver_->make_term(Forall, {z}, difference);
    Term forally = solver_->make_term(Forall, {this->y}, forallz);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

Term AbstractPBVWalker::bvand_min_range(){
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->y});
    Term min_range = solver_->make_term(Ge, ufbvand, zero);
    Term forally = solver_->make_term(Forall, {this->y}, min_range);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

Term AbstractPBVWalker::bvand_max_range(){
    Term condition = solver_->make_term(Gt, this->x, this->y);
    Term min = solver_->make_term(Ite, condition, this->y, this->x);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->y});
    Term max_range = solver_->make_term(Ge, min, ufbvand);
    Term forally = solver_->make_term(Forall, {this->y}, max_range);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

void PBVWalker::bvand_handle() {
    if (singlenton_axiom) {
        return;
    }
    singlenton_axiom = 1;
    // partial lemmas
    this->operator_rules->push_back(bvand_basecase());
    this->operator_rules->push_back(bvand_max());
    this->operator_rules->push_back(bvand_min());
    this->operator_rules->push_back(bvand_idempotence());
    this->operator_rules->push_back(bvand_contradiction());
    this->operator_rules->push_back(bvand_symmetry());
    this->operator_rules->push_back(bvand_difference());
    this->operator_rules->push_back(bvand_min_range());
    this->operator_rules->push_back(bvand_max_range());
    // add full axiom
    this->operator_rules->push_back(bvand_fullaxiom());
}

void FullPBVWalker::bvand_handle() {
    if (singlenton_axiom) {
        return;
    }
    singlenton_axiom = 1;
    this->operator_rules->push_back(bvand_fullaxiom());
}

void PartialPBVWalker::bvand_handle() {
    if (singlenton_axiom) {
        return;
    }
    singlenton_axiom = 1;
    this->operator_rules->push_back(bvand_basecase());
    this->operator_rules->push_back(bvand_max());
    this->operator_rules->push_back(bvand_min());
    this->operator_rules->push_back(bvand_idempotence());
    this->operator_rules->push_back(bvand_contradiction());
    this->operator_rules->push_back(bvand_symmetry());
    this->operator_rules->push_back(bvand_difference());
    this->operator_rules->push_back(bvand_min_range());
    this->operator_rules->push_back(bvand_max_range());
}

void EfficientPBVWalker::bvand_handle() {}


WalkerStepResult AbstractPBVWalker::visit_term(Term & term) {
  if (!preorder_)
  {
    Op op;
    if ((x->to_string()).substr(1, 3) != "div") {
        op = term->get_op();
    } else {
        op = IntDiv;
    }
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
                case Equal: { make_bit_width_term(it);
                            } break;
                case Distinct: { make_bit_width_term(it);
                            } break;
                case BVUge: { int_op = Ge;
                              make_bit_width_term(it);
                              save_in_cache(term, solver_->make_term(int_op, cached_children));
                            } break;
                case BVUgt: { int_op = Gt;
                              make_bit_width_term(it);
                              save_in_cache(term, solver_->make_term(int_op, cached_children));
                            } break;
                case BVUle: { int_op = Le;
                              make_bit_width_term(it);
                              save_in_cache(term, solver_->make_term(int_op, cached_children));
                            } break;
                case BVUlt: { int_op = Lt;
                              make_bit_width_term(it);
                              save_in_cache(term, solver_->make_term(int_op, cached_children));
                            } break;
                case BVSgt: { int_op = Gt;
                               make_bit_width_term(it);
                               Term left = (*it);
                               it++;
                               Term right = (*it);
                               Term res_left = uts(left);
                               Term res_right = uts(right);
                               save_in_cache(term, solver_->make_term(int_op, {res_left, res_right}));    
                            } break;
                case BVSge: { int_op = Ge;
                               make_bit_width_term(it);
                               Term left = (*it);
                               it++;
                               Term right = (*it);
                               Term res_left = uts(left);
                               Term res_right = uts(right);
                               save_in_cache(term, solver_->make_term(int_op, {res_left, res_right}));    
                            } break;
                case BVSlt: { int_op = Lt;
                               make_bit_width_term(it);
                               Term left = (*it);
                               it++;
                               Term right = (*it);
                               Term res_left = uts(left);
                               Term res_right = uts(right);
                               save_in_cache(term, solver_->make_term(int_op, {res_left, res_right}));     
                            } break;
                case BVSle: { int_op = Le;
                               make_bit_width_term(it);
                               Term left = (*it);
                               it++;
                               Term right = (*it);
                               Term res_left = uts(left);
                               Term res_right = uts(right);
                               save_in_cache(term, solver_->make_term(int_op, {res_left, res_right}));    
                            } break;
                case BVAdd: { int_op = Mod;
                            bit_width = get_bit_width_term(*it);
                            make_bit_width_term(it);
                            int_term = solver_->make_term(Plus, cached_children);
                            } break;
                case BVSub: { int_op = Mod;
                            bit_width = get_bit_width_term(*it);
                            make_bit_width_term(it);
                            int_term = solver_->make_term(Minus, cached_children);
                            } break;
                case BVMul: { int_op = Mod;
                            bit_width = get_bit_width_term(*it);
                            make_bit_width_term(it);
                            int_term = solver_->make_term(Mult, cached_children);
                            } break;
                case BVUdiv: { int_op = Ite;
                            bit_width = get_bit_width_term(*it);
                            make_bit_width_term(it);
                            Term y = *(++it);
                            Term translate_y;
                            query_cache(y, translate_y);
                            Sort intsort = solver_->make_sort(INT);
                            Term zero =  solver_->make_term(0, intsort);
                            Term condition = solver_->make_term(Equal, translate_y, zero);
                            Term power2_k = solver_->make_term(Pow, this->two, bit_width);
                            Term one =  solver_->make_term(1, intsort);
                            Term then_branch = solver_->make_term(Minus, power2_k, one);
                            Term else_branch = solver_->make_term(IntDiv, cached_children);
                            Term ite = solver_->make_term(Ite, condition, then_branch, else_branch);
                            save_in_cache(term, ite);
                            } break;
                case BVUrem: { int_op = Ite;
                            bit_width = get_bit_width_term(*it);
                            make_bit_width_term(it);
                            Term x = *it;
                            Term translate_x;
                            query_cache(x, translate_x);
                            Term y = *(++it);
                            Term translate_y;
                            query_cache(y, translate_y);
                            Sort intsort = solver_->make_sort(INT);
                            Term zero =  solver_->make_term(0, intsort);
                            Term condition = solver_->make_term(Equal, translate_y, zero);
                            Term then_branch = translate_x;
                            Term else_branch = solver_->make_term(Mod, cached_children);
                            Term ite = solver_->make_term(Ite, condition, then_branch, else_branch);
                            save_in_cache(term, ite);
                            } break;
                case BVNot: { int_op =  Minus;
                              Term x = *it;
                              save_in_cache(term, bvnot(x));
                            } break;
                case BVNeg: { int_op = Mod;
                              bit_width = get_bit_width_term(*it);
                              Term power2_k = solver_->make_term(Pow, this->two, bit_width);
                              Term x = *it;
                              Term translate_x;
                              query_cache(x, translate_x);
                              int_term = solver_->make_term(Minus, power2_k, translate_x);
                            } break;
                case BVShl: { 
                              Sort intsort = solver_->make_sort(INT);
                              bit_width = get_bit_width_term(*it);
                              if (minimum_sign(it)) {
                                int_op = Minus;
                                Term one =  solver_->make_term(1, intsort);
                                Term bit_width_minus_one = solver_->make_term(Minus, bit_width, one);
                                Term minimum_sign_term = solver_->make_term(Pow, this->two, bit_width_minus_one);
                                save_in_cache(term, minimum_sign_term);
                              } else {
                                Term x = *it;
                                Term translate_x;
                                query_cache(x, translate_x);
                                Term y = *(++it);
                                Term translate_y;
                                query_cache(y, translate_y);

                                //naive
                                int_op = Mod;
                                Term power2_y = solver_->make_term(Pow, this->two, translate_y);                                
                                Term mult = solver_->make_term(Mult, translate_x, power2_y);
                                int_term = mult;

                                //ite - 
                                // int_op = Ite;
                                // Op y_op = translate_y->get_op();
                                // if (!y_op.is_null() && y_op.prim_op == Mod) {
                                //     auto y_it = translate_y->begin();
                                //     Term val = *y_it;
                                //     y_it++;
                                //     Term modulo = *y_it;
                                //     Term power2_y = solver_->make_term(Pow, this->two, val);
                                //     Term power2_full_y = solver_->make_term(Pow, this->two, translate_y);
                                //     Term mult = solver_->make_term(Mult, translate_x, power2_y);
                                //     Term power2_k = solver_->make_term(Pow, this->two, bit_width);
                                //     Term condition = solver_->make_term(Lt, val, bit_width);
                                //     Term then_branch =  solver_->make_term(Mod, mult, power2_k);
                                //     Term gt_cond = solver_->make_term(Ge, val, power2_k);
                                //     Term zero = solver_->make_term(0, intsort);
                                //     Term full_mult = solver_->make_term(Mult, translate_x, power2_full_y);
                                //     Term full_mult_branch = solver_->make_term(Mod, full_mult, power2_k);
                                //     Term else_branch = solver_->make_term(Ite, gt_cond, full_mult_branch, zero);
                                //     Term ite =  solver_->make_term(Ite, condition ,then_branch, else_branch);
                                //     save_in_cache(term, ite);
                                // } else {
                                //     Term power2_y = solver_->make_term(Pow, this->two, translate_y);
                                //     Term mult = solver_->make_term(Mult, translate_x, power2_y);
                                //     Term power2_k = solver_->make_term(Pow, this->two, bit_width);
                                //     Term condition = solver_->make_term(Ge, translate_y, bit_width);
                                //     Term then_branch = solver_->make_term(0, intsort);
                                //     Term else_branch = solver_->make_term(Mod, mult, power2_k);
                                //     Term ite =  solver_->make_term(Ite, condition ,then_branch, else_branch);
                                //     save_in_cache(term, ite);
                                // }
                              }
                              
                            } break;
                case BVLshr: { int_op = Div; // Mod
                              bit_width = get_bit_width_term(*it);
                              Term x = *it;
                              Term y = *(++it);
                              save_in_cache(term, bvlshr(x, y));
                            } break;
                case Extract: { int_op = Ite;
                               Term i, j;
                               Term x = *it;
                               if (op.idx0 == -1 && op.idx1 == -1) {
                                 i = *(++it);
                                 j = *(++it);
                               } else {
                                 Sort intsort = solver_->make_sort(INT);
                                 i = solver_->make_term(op.idx0, intsort);
                                 j = solver_->make_term(op.idx1, intsort);
                               }
                               Term translate_x;
                               query_cache(x, translate_x);
                               save_in_cache(term, extract(translate_x, i, j));
                            } break;
                case Concat: { int_op = Plus;
                              Term x = *it;
                              Term translate_x;
                              query_cache(x, translate_x);
                              Term y = *(++it);
                              Term translate_y;
                              query_cache(y, translate_y);
                              Term bit_width_y = get_bit_width_term(y);
                              Term power2_y = solver_->make_term(Pow, this->two, bit_width_y);
                              Term x_mult_power2_y = solver_->make_term(Mult, translate_x, power2_y);
                              save_in_cache(term, solver_->make_term(int_op, x_mult_power2_y, translate_y));
                            } break;
                case BVAnd: { int_op = Apply;
                              Term k = get_bit_width_term(*it);
                              make_bit_width_term(it);
                              Term x = *it;
                              Term translate_x;
                              query_cache(x, translate_x);
                              Term y = *(++it);
                              Term translate_y;
                              query_cache(y, translate_y);
                              if (this->piand) {
                                save_in_cache(term, solver_->make_term(PIAnd, k, translate_x, translate_y));
                              } else {
                                bvand_handle();
                                save_in_cache(term, solver_->make_term(int_op, {this->bvand, k, translate_x, translate_y}));
                              }
                            } break;
                case BVOr: {  int_op = Minus;
                              Term k = get_bit_width_term(*it);
                              make_bit_width_term(it);
                              Term translate_k;
                              query_cache(k, translate_k);
                              Term x = *it;
                              Term translate_x;
                              query_cache(x, translate_x);
                              Term y = *(++it);
                              Term translate_y;
                              query_cache(y, translate_y);
                              // translate to bvand
                              Term x_plus_y = solver_->make_term(Plus, cached_children);
                              Term x_and_y;
                              if (this->piand) {
                                x_and_y = solver_->make_term(PIAnd, k, translate_x, translate_y);
                              } else {
                                x_and_y = solver_->make_term(Apply, {this->bvand, k, translate_x, translate_y});
                                bvand_handle();
                              }
                              save_in_cache(term, solver_->make_term(int_op, x_plus_y, x_and_y));
                            } break;
                case BVXor: { int_op = Minus;
                              Term k = get_bit_width_term(*it);
                              make_bit_width_term(it);
                              Term translate_k;
                              query_cache(k, translate_k);
                              Term x = *it;
                              Term translate_x;
                              query_cache(x, translate_x);
                              Term y = *(++it);
                              Term translate_y;
                              query_cache(y, translate_y);
                              // bvor and
                              Term x_plus_y = solver_->make_term(Plus, cached_children);
                              Term x_and_y;
                              if (this->piand) {
                                x_and_y = solver_->make_term(PIAnd, k, translate_x, translate_y);
                              } else {
                                x_and_y = solver_->make_term(Apply, {this->bvand, k, translate_x, translate_y});
                                bvand_handle();
                              }
                              Term x_or_y = solver_->make_term(int_op, x_plus_y, x_and_y);
                              save_in_cache(term, solver_->make_term(int_op, x_or_y, x_and_y));
                            } break;
                // Operators that do not need a translation!
                case Lt:
                case Le:
                case Gt:
                case Ge:
                case Plus:
                case Minus:
                case Negate:
                case Mult:
                case Div:
                case IntDiv:
                case Mod:
                case Pow:
                case And:
                case Or:
                case Xor:
                case Not:
                case Implies:
                case Ite:
                case Forall:
                case Exists:
                case PIAnd: {
                    TermVec cached_children;
                    Term c;
                    for (auto t : term)
                    {
                        c = t;
                        query_cache(t, c);
                        cached_children.push_back(c);
                    }
                    save_in_cache(term, solver_->make_term(op, cached_children));
                } break;
                default: 
                    cout << "The Operator " << op <<  " is not support!!!" << endl;
                    assert(false);
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
      // change bv, k ---> integer mod 2 ^ k
      if(term->is_pbvterm() && !term->is_value()) {
        Sort intsort = solver_->make_sort(INT);
        Term k = NULL;
        Sort pbv_sort = term->get_sort();
        shared_ptr<PBVSort> bv_sort = static_pointer_cast<PBVSort>(pbv_sort);
        Term bit_width = bv_sort->get_term();
        if (query_cache(term, k)){
            cout << "k: " << k << endl;
        }
        if (!query_cache(term, k) && term->to_string() != bit_width->to_string()){
            k = solver_->make_symbol("_pbv_" + term->to_string() ,intsort);
        } else {
            k = bit_width;
        }
        res = k;
        // 0 <= k <= pow2(k)
        Term zero =  solver_->make_term(0, intsort);
        Term ge = solver_->make_term(Ge, k, zero);
        term_rules->push_back(ge);
        try {
            Sort intsort = solver_->make_sort(INT);
            Term constbv = solver_->make_term(stoi(bit_width->to_string()), intsort);
            bit_width = constbv;
        } catch (...) {}
            Term two_2 = solver_->make_term(2, intsort);
            Term power2_k = solver_->make_term(Pow, two_2, bit_width);
            Term lt = solver_->make_term(Lt, k, power2_k);
            term_rules->push_back(lt);
      } else {
          if (term->is_value()) { // translate constant bit-vectors like: bv0
            Sort intsort = solver_->make_sort(INT);
            res = solver_->make_term(term->to_int(), intsort);
          } else {
            res = term;
          }
      }
      save_in_cache(term, res);
    }
  }
return Walker_Continue;
}

// PrePBVWalker function
WalkerStepResult PrePBVWalker::visit_term(Term & term) {
  if (!preorder_)
  {
    Op op = term->get_op();
    if (!op.is_null())
    {
      PrimOp primop = op.prim_op;
      auto it = term->begin();
      if (primop == BVAshr) {
        Term x = (*it);
        it++;
        Term y = (*it);
        Term k = get_bit_width_term(x);
        Sort intsort = solver_->make_sort(INT);
        Term zero =  solver_->make_term(0, intsort);
        Term one =  solver_->make_term(1, intsort);
        Sort bv1 = solver_->make_sort(BV, 1);
        Term k_minus_one = solver_->make_term(Minus, k, one);
        Term extract_bit = std::make_shared<PBVTerm>(Extract, TermVec{x, k_minus_one, k_minus_one});
        int64_t int_one = 1;
        Term const_bit_one = solver_->make_term(int_one, bv1);
        Term condition = std::make_shared<PBVTerm>(Equal, TermVec{extract_bit, const_bit_one});
        Term then_branch = std::make_shared<PBVTerm>(BVLshr, TermVec{x, y});
        Term bvnot = std::make_shared<PBVTerm>(BVNot, TermVec{x});
        Term bvlshr_bvnot = std::make_shared<PBVTerm>(BVLshr, TermVec{bvnot, y});
        Term else_branch = std::make_shared<PBVTerm>(BVNot, TermVec{bvlshr_bvnot});
        Term ite = std::make_shared<PBVTerm>(Ite, TermVec{condition, then_branch, else_branch});
        save_in_cache(term, ite);
    //   } else if (primop == BVSub) {
    //     Term x = (*it);
    //     it++;
    //     Term y = (*it);
    //     Term neg_y = std::make_shared<PBVTerm>(BVNeg, TermVec{y});
    //     Term bvadd = std::make_shared<PBVTerm>(BVAdd, TermVec{x, neg_y});
    //     save_in_cache(term, bvadd);
      } else {
        TermVec cached_children;
        Term c;
        for (Term t : term)
        {
            c = t;
            query_cache(t, c);
            cached_children.push_back(c);
        }
        if(term->is_pbvterm()) {
            Term pbv = std::make_shared<PBVTerm>(op, cached_children);
            save_in_cache(term, pbv);
        } else {
            save_in_cache(term, solver_->make_term(op, cached_children));
        }
      }
    }
    else
    {
        save_in_cache(term, term);
    }
  }
return Walker_Continue;
}

// PostPBVWalker function
bool isOp(Term x, PrimOp op) {
    if ((x->to_string()).substr(1, 3) != "div") {
        Op x_op = x->get_op();
        if (!x_op.is_null()) {
            PrimOp prim = x_op.prim_op;
            if (prim == op) {
                return true;
            }
        }
    } else if (op == BVUdiv) {
        return true;
    }
    return false;
}

Term rmMod(Term x, Term mod) {
    if ((x->to_string()).substr(1, 3) != "div") {
        Op x_op = x->get_op();
        PrimOp x_primop = x_op.prim_op;
        if (x_primop == Mod) {
            auto it = x->begin();
            Term left = *it;
            it++;
            Term right = *it;
            if(mod ==  right) {
                return left;
            }
        }
    }
    return x;
}



WalkerStepResult PostPBVWalker::visit_term(Term & term) {
 if (!preorder_)
  {
  if ((term->to_string()).substr(1, 3) != "div") {
    Op op = term->get_op();
    if (!op.is_null())
    {
      TermVec cached_children;
      Term c;
      PrimOp primop = op.prim_op;
      if (primop == Mod) { // remove unnecessary mod
        auto it = term->begin();
        Term x = (*it);
        it++;
        Term y = (*it);
        if ((x->to_string()).substr(1, 3) != "div" && (x->to_string()).substr(1, 2) != "^") {
            Op x_op = x->get_op();
            PrimOp x_primop = x_op.prim_op;
            if (!x_op.is_null() && (x_primop == Plus || x_primop == Minus || x_primop == Mult)) {
                Term ef_x, ef_left, ef_right;
                query_cache(x ,ef_x);
                auto x_it = ef_x->begin();
                Term left = *x_it;
                x_it++;
                Term right = *x_it;
                if (isOp(left, Ite)) {
                    auto ite_it = left->begin();
                    Term condition = *ite_it;
                    ++ite_it;
                    Term then_branch =  *ite_it;
                    ++ite_it;
                    Term else_branch =  *ite_it;
                    ef_left = solver_->make_term(Ite, condition, rmMod(then_branch, y), rmMod(else_branch, y));
                } else {
                    ef_left = rmMod(left, y);
                }
                cached_children.push_back(ef_left);
                if (isOp(right, Ite)) {
                    auto ite_it = right->begin();
                    Term condition = *ite_it;
                    ++ite_it;
                    Term then_branch =  *ite_it;
                    ++ite_it;
                    Term else_branch =  *ite_it;
                    ef_right = solver_->make_term(Ite, condition, rmMod(then_branch, y), rmMod(else_branch, y));
                } else {
                    ef_right = rmMod(right, y);
                }
                cached_children.push_back(ef_right);
                Term ef_term = solver_->make_term(x_op, cached_children);
                Term trans = solver_->make_term(op, TermVec{ef_term, y});
                save_in_cache(term, trans);
                return Walker_Continue;
            }
        }
      } else if (primop == Equal || primop == Distinct) { // s = s*s mod 2^n -> s <= 1
        auto it = term->begin();
        Term x = (*it);
        it++;
        Term y = (*it);
        if ((y->to_string()).substr(1, 3) == "div") {
            return Walker_Continue;
        }
        Op y_op = y->get_op();
        if (!y_op.is_null()) {
            PrimOp y_primop = y_op.prim_op;
            if (y_primop == Mod) {
                auto y_it = y->begin();
                Term inmod = *y_it;
                if ((inmod->to_string()).substr(1, 3) == "div") {
                    return Walker_Continue;
                }
                Op inmod_op = inmod->get_op();
                PrimOp inmod_primop = inmod_op.prim_op;
                if (inmod_primop == Mult) {
                    auto inmod_it = inmod->begin();
                    Term right = *inmod_it;
                    inmod_it++;
                    Term left = *inmod_it;
                    if (x->to_string() == right->to_string() && x->to_string() == left->to_string()) {
                        Sort intsort = solver_->make_sort(INT);
                        Term one =  solver_->make_term(1, intsort);
                        Term implies;
                        Term x_le_one = solver_->make_term(Le, x, one);
                        if (primop == Distinct) {
                            for (auto t : term)
                            {
                                c = t;
                                query_cache(t, c);
                                cached_children.push_back(c);
                            }
                            Term equal_term = solver_->make_term(Equal, cached_children);
                            implies = solver_->make_term(Implies, equal_term, x_le_one);
                        } else if (primop == Equal) {
                            implies = solver_->make_term(Implies, term, x_le_one);
                        }
                        operator_rules->push_back(implies);
                        return Walker_Continue;
                    }
                }
            }
        }
        for (auto t : term)
        {
            c = t;
            query_cache(t, c);
            cached_children.push_back(c);
        }
        save_in_cache(term, solver_->make_term(op, cached_children));
      } else {
        for (auto t : term)
        {
            c = t;
            query_cache(t, c);
            cached_children.push_back(c);
        }
        save_in_cache(term, solver_->make_term(op, cached_children));
      }
    }
    else
    {
        save_in_cache(term, term);
    }
  } else {
    save_in_cache(term, term);
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