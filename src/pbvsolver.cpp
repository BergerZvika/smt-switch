
#include "pbvsolver.h"
#include <iostream>
#include <fstream>
#include <string>
#include <map>

using namespace std;

template<typename Base, typename T>
inline bool instanceof(const T*) {
   return is_base_of<Base, T>::value;
}


namespace smt {
 map<string, Sort> mp;


    AbstractPBVSolver::AbstractPBVSolver(SmtSolver s) : AbsSmtSolver(s->get_solver_enum()),
      wrapped_solver(s) {
          Sort intsort = s->make_sort(INT);
    }

    AbstractPBVSolver::AbstractPBVSolver(SmtSolver s, int debug) : AbsSmtSolver(s->get_solver_enum()),
      wrapped_solver(s), debug(debug) {
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
        if(sort->get_sort_kind() == BV) {
            return make_pbv_param(name, sort);
        }
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
        int isPbv = false;
        for (Term t : terms) {
            if (t->is_pbvterm()) {
                isPbv = true;
                break;
            }
        }
        if (isPbv || op == PSign_Extend || op == PZero_Extend || op == PExtract) {
            Term pbvt = std::make_shared<PBVTerm>(op, terms);
            return pbvt;
        }
        return wrapped_solver->make_term(op, terms);
    }
    Term AbstractPBVSolver::get_value(const Term & t) const {
        return wrapped_solver->get_value(t);
    }

    Term AbstractPBVSolver::get_value(const std::string & name) const {
        // Term val = wrapped_solver->make_ter
        // return wrapped_solver->get_value(val);
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

    Term AbstractPBVSolver::make_pbv_param(const std::string & name, const Sort & s) const {
        Term pbvt = std::make_shared<PBVTerm>(name, s, true);
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
            } else if (op.prim_op == PSign_Extend || op.prim_op == PZero_Extend) {
                Term k = t0;
                PBVTerm x = t1;
                shared_ptr<PBVSort> pbvsort = static_pointer_cast<PBVSort>(x.get_sort());
                Term plus = std::make_shared<PBVTerm>(Plus, TermVec{k, pbvsort->get_term()});
                s = std::make_shared<PBVSort>(BV, plus);
            } else {
                s = compute_sort(op, this, {t0->get_sort(), t1->get_sort()});
            }
            
            Term pbvt = std::make_shared<PBVTerm>(s, op, TermVec{t0, t1});
            return pbvt;
        }
        return wrapped_solver->make_term(op, t0, t1);
    }

Term AbstractPBVSolver::substitute(const Term term, const UnorderedTermMap & substitution_map) {
     return wrapped_solver->substitute(term, substitution_map);
}

int AbstractPBVSolver::check_simplify(const Term& t) {
    Term res;
    int four = 4;
    PBVConstantWalker* simp_walker = new PBVConstantWalker(wrapped_solver, four);
    PBVParametricWalker* ret_walker = new PBVParametricWalker(wrapped_solver);
    Term const_term = simp_walker->visit(const_cast<Term&>(t));
    res = wrapped_solver->simplify(const_term);
    if (const_term == res) {
        return 0;
    }
    Term pret = ret_walker->visit(const_cast<Term&>(res));
    for (int i = 1; i <= 64; i++) {
        if (i == four) {
            continue;
        }
        PBVConstantWalker* temp_simp_walker = new PBVConstantWalker(wrapped_solver, i);
        Term temp_const_term = temp_simp_walker->visit(const_cast<Term&>(t));
        Term const_i = wrapped_solver->simplify(temp_const_term);
        Term res_i = ret_walker->visit(const_cast<Term&>(const_i));
        if (pret != res_i) {
            return 0;
        }
    }
    return 1;
}

Term AbstractPBVSolver::simplify(const Term& t) {
    Term res;
    int four = 4;
    PBVConstantWalker* simp_walker = new PBVConstantWalker(wrapped_solver, four);
    PBVParametricWalker* ret_walker = new PBVParametricWalker(wrapped_solver);
    Term const_term = simp_walker->visit(const_cast<Term&>(t));
    res = wrapped_solver->simplify(const_term);
    Term pret = ret_walker->visit(const_cast<Term&>(res));
    int width = this->simplify_num;
    if (width < 0) {
        width *= 1;
    }
    for (int i = 1; i <= width; i++) {
        if (i == four) {
            continue;
        }
        PBVConstantWalker* temp_simp_walker = new PBVConstantWalker(wrapped_solver, i);
        Term temp_const_term = temp_simp_walker->visit(const_cast<Term&>(t));
        Term const_i = wrapped_solver->simplify(temp_const_term);
        Term res_i = ret_walker->visit(const_cast<Term&>(const_i));
        if (pret != res_i) {
            return t;
        }
    }
    return pret;
}

Term AbstractPBVSolver::translate_term(const Term & t) {
        Term res, pre_res, bit_width, simp_term, simp_after;
        if(this->simplify_num > 0) {
          simp_term = simplify(t);
        } else if (simplify_num < -1){
          simp_term = simplify(t);
          if (!(simp_term->to_string()).compare("false") || !(simp_term->to_string()).compare("true")) {
                simp_term = simp_term;
          } else {
            simp_term = t;
          }
        } else {
          simp_term = t;
        }
        Term term;
        PrePBVWalker* prewalk = new PrePBVWalker(wrapped_solver, this->bvsub);
        if(this->rewrite == 1) {
          RewritePBVWalker* rewritewalk = new RewritePBVWalker(wrapped_solver, this->bvsub);
          Term rewrite_term = rewritewalk->visit(const_cast<Term&>(t));
          if (this->debug) {
            cout << "Rewrite term: " << rewrite_term << endl;
          }
          term = prewalk->visit(const_cast<Term&>(rewrite_term));
        } else {
          term = prewalk->visit(const_cast<Term&>(simp_term));
        }
        // postwalk
        if (this->postwalk) {
            pre_res = this->walker->visit(term);
            PostPBVWalker* postwalk = new PostPBVWalker(wrapped_solver, &term_rules);
            res = postwalk->visit(pre_res);
        } else {
            res = this->walker->visit(term);
        }
        
        // res /\ set rules
        for (Term r : term_rules) {
            res = wrapped_solver->make_term(And, res, r);
        }
        int flag = 0;
        for (Term r : operator_rules) {
            if(!flag) {
                flag++;
                bit_width = r;
                continue;
            }
            bit_width = wrapped_solver->make_term(And, bit_width, r);
        }
        if (flag) {
            res = wrapped_solver->make_term(And, res, bit_width);
        }
        if (this->debug) {
            cout << "original term: " << t << endl;
             if(this->simplify_num != -1) {
                cout << "simplify term: " << simp_term << endl;
             }
            cout << "translate term: " << res << endl;
        }
        if (this->translate) {
            std::ofstream outFile("temp.txt", std::ios::app);
            if (!outFile) {
                throw std::runtime_error("Unable to create the file: temp.txt");
            }
            outFile << res->to_string() << std::endl;
            outFile.close();
        }
        term_rules.clear();
        operator_rules.clear();
        if (this->type_check == 1) {
            if (flag) {
                return bit_width;
            }
            return NULL;
        }
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
        } else if (choose_walker == 4) {
            this->walker = new NonPurePBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
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
        } else if (choose_walker == 4) {
            this->walker = new NonPurePBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        this->postwalk = postwalk;
    }

    PBVSolver::PBVSolver(SmtSolver s, int debug, int choose_walker, int postwalk, int type_check): AbstractPBVSolver(s, debug) {
        if (type_check) {
            this->walker = new TypeCheckerWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 0) {
            this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        else if (choose_walker == 1) {
            this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 2) {
            this->walker = new FullPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 3) {
            this->walker = new PartialPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 4) {
            this->walker = new NonPurePBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        this->postwalk = postwalk;
        this->type_check = type_check;
    }

    PBVSolver::PBVSolver(SmtSolver s, int debug, int choose_walker, int postwalk, int type_check, int translate): AbstractPBVSolver(s, debug) {
        if (type_check) {
            this->walker = new TypeCheckerWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 0) {
            this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        else if (choose_walker == 1) {
            this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 2) {
            this->walker = new FullPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 3) {
            this->walker = new PartialPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 4) {
            this->walker = new NonPurePBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        this->postwalk = postwalk;
        this->type_check = type_check;
        this->translate = translate;
    }

    PBVSolver::PBVSolver(SmtSolver s, int debug, int choose_walker, int postwalk, int type_check, int translate, int pbvsub): AbstractPBVSolver(s, debug) {
        if (type_check) {
            this->walker = new TypeCheckerWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 0) {
            this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        else if (choose_walker == 1) {
            this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 2) {
            this->walker = new FullPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 3) {
            this->walker = new PartialPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 4) {
            this->walker = new NonPurePBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        this->postwalk = postwalk;
        this->type_check = type_check;
        this->translate = translate;
        this->bvsub = pbvsub;
    }

    PBVSolver::PBVSolver(SmtSolver s, int debug, int choose_walker, int postwalk, int type_check, int translate, int pbvsub, int simplify_num): AbstractPBVSolver(s, debug) {
        if (type_check) {
            this->walker = new TypeCheckerWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 0) {
            this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        else if (choose_walker == 1) {
            this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 2) {
            this->walker = new FullPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 3) {
            this->walker = new PartialPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 4) {
            this->walker = new NonPurePBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        this->postwalk = postwalk;
        this->type_check = type_check;
        this->translate = translate;
        this->bvsub = pbvsub;
        this->simplify_num = simplify_num;
    }

    PBVSolver::PBVSolver(SmtSolver s, int debug, int choose_walker, int postwalk, int type_check, int translate, int pbvsub, int simplify_num, int rewrite): AbstractPBVSolver(s, debug) {
                if (type_check) {
            this->walker = new TypeCheckerWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 0) {
            this->walker = new EfficientPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        else if (choose_walker == 1) {
            this->walker = new PBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 2) {
            this->walker = new FullPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 3) {
            this->walker = new PartialPBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } else if (choose_walker == 4) {
            this->walker = new NonPurePBVWalker(wrapped_solver, &term_rules, &operator_rules, power2);
        } 
        this->postwalk = postwalk;
        this->type_check = type_check;
        this->translate = translate;
        this->bvsub = pbvsub;
        this->simplify_num = simplify_num;
        this->rewrite = rewrite;
    }

    


    int check_simplify_flag = 1;
    void PBVSolver::assert_formula(const Term & t) {
        if (this->simplify_num == 0) {
            if (check_simplify(t) && check_simplify_flag) {
                cout << 1 << endl;
                check_simplify_flag = 0;
            }
        } else {
            Term res = translate_term(t);
            if (!this->translate && res) {
                wrapped_solver->assert_formula(res);
            }
        }
    }


Term AbstractPBVWalker::uts(Term t) {
    Sort intsort = solver_->make_sort(INT);
    Term bit_width_term = get_bit_width_term(t);
    Term power2_k = solver_->make_term(Pow, this->two, bit_width_term);
    // translate t to _pbv_t
    Term k;
    if (!query_cache(t, k)){
        if (t->is_param()) {
                k = solver_->make_param("_pbv_" + t->to_string() ,intsort);
        } else if(t->is_symbol()) {
                k = solver_->make_symbol("_pbv_" + t->to_string() ,intsort);
        }
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
    // if (postwalker) {
    //     return int_term;
    // }
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
    Term power2_j = solver_->make_term(Pow, this->two, j);
    Term x_div_power2_j = solver_->make_term(IntDiv, x, power2_j); // x / 2^j
    Sort intsort = solver_->make_sort(INT);
    Term one =  solver_->make_term(1, intsort);
    Term i_plus_one = solver_->make_term(Plus, i, one);
    Term i_plus_one_minus_j = solver_->make_term(Minus, i_plus_one, j);
    Term power2_i_plus_one_minus_j = solver_->make_term(Pow, this->two, i_plus_one_minus_j);
    Term zero =  solver_->make_term(0, intsort);
    if (j == zero) {
        if (i == zero) {
            return solver_->make_term(Mod, x, this->two); // j = 0 && i = 0 -> x mod 2
        }
        Term power2_i_plus_one = solver_->make_term(Pow, this->two, i_plus_one);
        return solver_->make_term(Mod, x, power2_i_plus_one); // j = 0 -> x mod 2^(i+1)
    }
    return solver_->make_term(Mod, x_div_power2_j, power2_i_plus_one_minus_j); // (x / 2^j) mod 2^(i-j+1)
}

Term AbstractPBVWalker::extractSort(Term t) {
    if (t->to_string() == "true"  || t->to_string() == "false" ) {
        return NULL;
    }
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
            if ((t->get_op()).idx0 == -2 && (t->get_op()).idx1 == -2) {
                Term i, j;
                auto it = t->begin();
                i = *(++it);
                j = *(++it);
                Term one =  solver_->make_term(1, intsort);
                if (i == j) {
                    return one;
                }
                Term i_plus_one = solver_->make_term(Plus, i, one);
                return solver_->make_term(Minus, i_plus_one, j);
            }
            return solver_->make_term((t->get_op()).idx0 + 1 - (t->get_op()).idx1, intsort);
        } else if (t->get_op().prim_op == Ite) {
            auto it = t->begin();
            Term t0 = (*it);
            it++;
            Term t1 = (*it);
            return extractSort(t1);
        } else if (t->get_op().prim_op == BVAnd) {
            auto it = t->begin();
            Term t0 = (*it);
            return extractSort(t0);
        } else if (t->get_op().prim_op == Distinct || t->get_op().prim_op == Equal || 
                    t->get_op().prim_op == Le || t->get_op().prim_op == Lt || t->get_op().prim_op == Ge 
                    || t->get_op().prim_op == Gt || t->get_op().prim_op == And || t->get_op().prim_op == Or) {
            return NULL;
        } else {
            return get_bit_width_term(t);
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
    if ((t0->is_pbvterm() || t0->is_value()) && (t1->is_pbvterm() || t1->is_value())) {
        Term width_left = extractSort(t0);
        Term width_right = extractSort(t1);
        if (width_left == NULL || width_right == NULL) {
            return;
        }
        Term bitWidth = solver_->make_term(Equal, width_left, width_right);
        // add lemma: width_left = width_right
        int exists = 0;
        for (Term rule : *operator_rules) {
            if(rule == bitWidth) {
                exists = 1;
                break;
            }
        }
        if (!exists) {
            operator_rules->push_back(bitWidth);
        }
        // lemma: width > 0
        exists = 0;
        Sort intsort = solver_->make_sort(INT);
        Term zero =  solver_->make_term(0, intsort);
        Term greater = solver_->make_term(Gt, width_left, zero);
        for (Term rule : *operator_rules) {
            if(rule == greater) {
                exists = 1;
                break;
            }
        }
        if (!exists) {
            operator_rules->push_back(greater);
        } 
        // lemma non-pure: k <= 67,108,864
        if (this->nonpure) {
            exists = 0;
            Sort intsort = solver_->make_sort(INT);
            Term maxint =  solver_->make_term(67108864, intsort);
            Term upper_bound = solver_->make_term(Lt, width_left, maxint);
            for (Term rule : *operator_rules) {
                if(rule == upper_bound) {
                    exists = 1;
                    break;
                }
            }
            if (!exists) {
                operator_rules->push_back(upper_bound);
            } 
        }
    }
}

Term AbstractPBVWalker::get_bit_width_term(Term t) {
    Sort s = t->get_sort();
    if (s->get_width() != -1) { // const integer width
        uint64_t width = s->get_width();
        Sort intsort = solver_->make_sort(INT);
        Term constbv = solver_->make_term(width, intsort);
        return constbv;
    }
    Op op = t->get_op();
     if (op.prim_op == PSign_Extend || op.prim_op == PZero_Extend) {
        auto it = t->begin();
        Term k = *it;
        it++;
        PBVTerm x = *it;
        shared_ptr<PBVSort> pbvsort = static_pointer_cast<PBVSort>(x.get_sort());
        Term plus = solver_->make_term(Plus, k, pbvsort->get_term());
        return plus;
    } else if (op.is_null() && (t->is_pbvterm() || t->is_value())) {
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
    } else if (op.prim_op == Extract) {
        Sort intsort = solver_->make_sort(INT);
        if ((t->get_op()).idx0 == -2 && (t->get_op()).idx1 == -2) {
            Term i, j;
            auto it = t->begin();
            i = *(++it);
            j = *(++it);
            Term one =  solver_->make_term(1, intsort);
            if (i == j) {
                return one;
            }
            Term i_plus_one = solver_->make_term(Plus, i, one);
            return solver_->make_term(Minus, i_plus_one, j);
        }
        return solver_->make_term((t->get_op()).idx0 + 1 - (t->get_op()).idx1, intsort);
    } else if (op.prim_op == Concat) {
        auto it = t->begin();
        Term t0 = (*it);
        it++;
        Term t1 = (*it);
        return solver_->make_term(Plus, get_bit_width_term(t0), get_bit_width_term(t1));
    } else if (op.prim_op == Ite) {
         auto it = t->begin();
        Term condition = *it;
        it++;
        Term then = *it;
        return get_bit_width_term(then);
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
    return NULL;
}

Term PrePBVWalker::get_bit_width_term(Term t) {
Sort s = t->get_sort();
    if (s->get_width() != -1) { // const integer width
        uint64_t width = s->get_width();
        Sort intsort = solver_->make_sort(INT);
        Term constbv = solver_->make_term(width, intsort);
        return constbv;
    }
    Op op = t->get_op();
     if (op.prim_op == PSign_Extend || op.prim_op == PZero_Extend) {
        auto it = t->begin();
        Term k = *it;
        it++;
        PBVTerm x = *it;
        shared_ptr<PBVSort> pbvsort = static_pointer_cast<PBVSort>(x.get_sort());
        Term plus = solver_->make_term(Plus, k, pbvsort->get_term());
        return plus;
    } else if (op.is_null() && (t->is_pbvterm() || t->is_value())) {
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
    } else if (op.prim_op == Extract) {
        Sort intsort = solver_->make_sort(INT);
        if ((t->get_op()).idx0 == -2 && (t->get_op()).idx1 == -2) {
            Term i, j;
            auto it = t->begin();
            i = *(++it);
            j = *(++it);
            Term one =  solver_->make_term(1, intsort);
            if (i == j) {
                return one;
            }
            Term i_plus_one = solver_->make_term(Plus, i, one);
            return solver_->make_term(Minus, i_plus_one, j);
        }
        return solver_->make_term((t->get_op()).idx0 + 1 - (t->get_op()).idx1, intsort);
    } else if (op.prim_op == Concat) {
        auto it = t->begin();
        Term t0 = (*it);
        it++;
        Term t1 = (*it);
        return solver_->make_term(Plus, get_bit_width_term(t0), get_bit_width_term(t1));
    } else if (op.prim_op == Ite) {
         auto it = t->begin();
        Term condition = *it;
        it++;
        Term then = *it;
        return get_bit_width_term(then);
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
    return NULL;
}

Term RewritePBVWalker::get_bit_width_term(Term t) {
    Sort s = t->get_sort();
    Op op = t->get_op();
     if (!op.is_null() && op.prim_op == PSign_Extend || op.prim_op == PZero_Extend) {
        auto it = t->begin();
        Term k = *it;
        it++;
        PBVTerm x = *it;
        shared_ptr<PBVSort> pbvsort = static_pointer_cast<PBVSort>(x.get_sort());
        Term plus = solver_->make_term(Plus, k, pbvsort->get_term());
        return plus;
    }
    if (op.is_null() && s->get_width() != -1) { // const integer width
        uint64_t width = s->get_width();
        Sort intsort = solver_->make_sort(INT);
        Term constbv = solver_->make_term(width, intsort);
        return constbv;
    }
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
    } else if (op.prim_op == Extract) {
        Sort intsort = solver_->make_sort(INT);
        if ((t->get_op()).idx0 == -2 && (t->get_op()).idx1 == -2) {
            Term i, j;
            auto it = t->begin();
            i = *(++it);
            j = *(++it);
            Term one =  solver_->make_term(1, intsort);
            if (i == j) {
                return one;
            }
            Term i_plus_one = solver_->make_term(Plus, i, one);
            return solver_->make_term(Minus, i_plus_one, j);
        }
        return solver_->make_term((t->get_op()).idx0 + 1 - (t->get_op()).idx1, intsort);
    } else if (op.prim_op == Concat) {
        auto it = t->begin();
        Term t0 = (*it);
        it++;
        Term t1 = (*it);
        return solver_->make_term(Plus, get_bit_width_term(t0), get_bit_width_term(t1));
    } else if (op.prim_op == Ite) {
         auto it = t->begin();
        Term condition = *it;
        it++;
        Term then = *it;
        return get_bit_width_term(then);
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
    return NULL;
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
    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term y_possitive = solver_->make_term(Ge, this->y, zero);
    Term y_bound = solver_->make_term(Lt, this->y, pow2k);
    Term condition3 = solver_->make_term(And, TermVec{k_possitive, x_possitive, x_bound, y_possitive, y_bound});
    Term imp = solver_->make_term(Implies, condition3, equal);
    Term forally = solver_->make_term(Forall, {this->y}, imp);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

Term AbstractPBVWalker::bvand_basecase() {
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term one =  solver_->make_term(1, intsort);
    Term x_mod_2 = solver_->make_term(Mod, this->x, this->two);
    Term y_mod_2 = solver_->make_term(Mod, this->y, this->two);
    Term condition_ge = solver_->make_term(Gt, y_mod_2, x_mod_2);
    Term min = solver_->make_term(Ite, condition_ge, x_mod_2, y_mod_2);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  one,  this->x,  this->y});
    Term basecase = solver_->make_term(Equal, ufbvand, min);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term y_possitive = solver_->make_term(Ge, this->y, zero);
    Term x_bound = solver_->make_term(Le, this->x, one);
    Term y_bound = solver_->make_term(Le, this->y, one);
    Term condition = solver_->make_term(And, TermVec{x_possitive, y_possitive, x_bound, y_bound});
    Term imp = solver_->make_term(Implies, condition, basecase);
    Term forally = solver_->make_term(Forall, {this->y}, imp);
    return solver_->make_term(Forall, {this->x}, forally);
}

Term AbstractPBVWalker::bvand_max() {
    Sort intsort = solver_->make_sort(INT);
    Term one =  solver_->make_term(1, intsort);
    Term zero =  solver_->make_term(0, intsort);
    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term max_k = solver_->make_term(Minus, pow2k, one);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  max_k});
    Term max = solver_->make_term(Equal, ufbvand, this->x);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term condition = solver_->make_term(And, k_possitive, x_possitive, x_bound);
    Term imp = solver_->make_term(Implies, condition, max);
    Term forallk = solver_->make_term(Forall, {this->x}, imp);
    return solver_->make_term(Forall, {this->k}, forallk);
}

Term AbstractPBVWalker::bvand_min() {
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  zero});
    Term min = solver_->make_term(Equal, ufbvand, zero);

    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term condition = solver_->make_term(And, k_possitive, x_possitive, x_bound);
    Term imp = solver_->make_term(Implies, condition, min);
    Term forallk = solver_->make_term(Forall, {this->x}, imp);
    return solver_->make_term(Forall, {this->k}, forallk);
}

Term AbstractPBVWalker::bvand_idempotence(){
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->x});
    Term idempotence = solver_->make_term(Equal, ufbvand, this->x);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term condition = solver_->make_term(And, k_possitive, x_possitive, x_bound);
    Term imp = solver_->make_term(Implies, condition, idempotence);
    Term forallk = solver_->make_term(Forall, {this->x}, imp);
    return solver_->make_term(Forall, {this->k}, forallk);
}

Term AbstractPBVWalker::bvand_contradiction() {
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term one =  solver_->make_term(1, intsort);
    Term pow2_k = solver_->make_term(Pow, this->two, this->k);
    Term x_plus_one = solver_->make_term(Plus, this->x, one);
    Term not_x = solver_->make_term(Minus, pow2_k, x_plus_one);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  not_x});
    Term contradiction = solver_->make_term(Equal, ufbvand, zero);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term condition = solver_->make_term(And, k_possitive, x_possitive, x_bound);
    Term imp = solver_->make_term(Implies, condition, contradiction);
    Term forallk = solver_->make_term(Forall, {this->x}, imp);
    return solver_->make_term(Forall, {this->k}, forallk);
}

Term AbstractPBVWalker::bvand_symmetry() {
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->y});
    Term symmetry_ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->y,  this->x});
    Term symmetry = solver_->make_term(Equal, ufbvand, symmetry_ufbvand);
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term y_possitive = solver_->make_term(Ge, this->y, zero);
    Term y_bound = solver_->make_term(Lt, this->y, pow2k);
    Term condition = solver_->make_term(And, TermVec{k_possitive, x_possitive, x_bound, y_possitive, y_bound});
    Term imp =  solver_->make_term(Implies, condition, symmetry);
    Term forally = solver_->make_term(Forall, {this->y}, imp);
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
    Term zero =  solver_->make_term(0, intsort);
    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term y_possitive = solver_->make_term(Ge, this->y, zero);
    Term y_bound = solver_->make_term(Lt, this->y, pow2k);
    Term z_possitive = solver_->make_term(Ge, z, zero);
    Term z_bound = solver_->make_term(Lt, z, pow2k);
    Term condition = solver_->make_term(And, TermVec{k_possitive, x_possitive, x_bound, y_possitive, y_bound, z_possitive, z_bound});
    Term imp =  solver_->make_term(Implies, condition, difference);
    Term forallz = solver_->make_term(Forall, {z}, imp);
    Term forally = solver_->make_term(Forall, {this->y}, forallz);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

Term AbstractPBVWalker::bvand_min_range() {
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->y});
    Term min_range = solver_->make_term(Ge, ufbvand, zero);
    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term y_possitive = solver_->make_term(Ge, this->y, zero);
    Term y_bound = solver_->make_term(Lt, this->y, pow2k);
    Term condition = solver_->make_term(And, TermVec{k_possitive, x_possitive, x_bound, y_possitive, y_bound});
    Term imp =  solver_->make_term(Implies, condition, min_range);
    Term forally = solver_->make_term(Forall, {this->y}, imp);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

Term AbstractPBVWalker::bvand_max_range(){
    Term gt = solver_->make_term(Gt, this->x, this->y);
    Term min = solver_->make_term(Ite, gt, this->y, this->x);
    Term ufbvand = solver_->make_term(Apply, {this->bvand,  this->k,  this->x,  this->y});
    Term max_range = solver_->make_term(Ge, min, ufbvand);
    Sort intsort = solver_->make_sort(INT);
    Term zero =  solver_->make_term(0, intsort);
    Term pow2k = solver_->make_term(Pow, this->two, this->k);
    Term k_possitive = solver_->make_term(Gt, this->k, zero);
    Term x_possitive = solver_->make_term(Ge, this->x, zero);
    Term x_bound = solver_->make_term(Lt, this->x, pow2k);
    Term y_possitive = solver_->make_term(Ge, this->y, zero);
    Term y_bound = solver_->make_term(Lt, this->y, pow2k);
    Term condition = solver_->make_term(And, TermVec{k_possitive, x_possitive, x_bound, y_possitive, y_bound});
    Term imp = solver_->make_term(Implies, condition, max_range);
    Term forally = solver_->make_term(Forall, {this->y}, imp);
    Term forallx = solver_->make_term(Forall, {this->x}, forally);
    return solver_->make_term(Forall, {this->k}, forallx);
}

void PBVWalker::bvand_handle() {
    if (singlenton_axiom) {
        return;
    }
    singlenton_axiom = 1;
    // partial lemmas
    this->term_rules->push_back(bvand_basecase());
    this->term_rules->push_back(bvand_max());
    this->term_rules->push_back(bvand_min());
    this->term_rules->push_back(bvand_idempotence());
    this->term_rules->push_back(bvand_contradiction());
    this->term_rules->push_back(bvand_symmetry());
    this->term_rules->push_back(bvand_difference());
    this->term_rules->push_back(bvand_min_range());
    this->term_rules->push_back(bvand_max_range());
    // add full axiom
    this->term_rules->push_back(bvand_fullaxiom());
}

void FullPBVWalker::bvand_handle() {
    if (singlenton_axiom) {
        return;
    }
    singlenton_axiom = 1;
    this->term_rules->push_back(bvand_fullaxiom());
}

void PartialPBVWalker::bvand_handle() {
    if (singlenton_axiom) {
        return;
    }
    singlenton_axiom = 1;
    this->term_rules->push_back(bvand_basecase());
    this->term_rules->push_back(bvand_max());
    this->term_rules->push_back(bvand_min());
    this->term_rules->push_back(bvand_idempotence());
    this->term_rules->push_back(bvand_contradiction());
    this->term_rules->push_back(bvand_symmetry());
    this->term_rules->push_back(bvand_difference());
    this->term_rules->push_back(bvand_min_range());
    this->term_rules->push_back(bvand_max_range());
}

void EfficientPBVWalker::bvand_handle() {}
void TypeCheckerWalker::bvand_handle() {}
void NonPurePBVWalker::bvand_handle() {}


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
                               if (op.idx0 == -2 && op.idx1 == -2) {
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
                              Sort intsort = solver_->make_sort(INT);
                              Term zero =  solver_->make_term(0, intsort);
                                Term power2_y = solver_->make_term(Pow, this->two, bit_width_y);
                                Term x_mult_power2_y = solver_->make_term(Mult, translate_x, power2_y);
                                save_in_cache(term, solver_->make_term(int_op, x_mult_power2_y, translate_y));
                            //   }
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
                case Exists: { int_op = Minus;
                            Term translate_param, translate_right;
                            Term param = (*it);
                            query_cache(param, translate_param);
                            it++;
                            Term right = (*it);
                            query_cache(right, translate_right);
                            // 0 <= param < 2^k /\ formula
                            Term k = get_bit_width_term(param);
                            Sort intsort = solver_->make_sort(INT);
                            Term zero =  solver_->make_term(0, intsort);
                            Term positive = solver_->make_term(Ge, TermVec{translate_param, zero});   
                            Term two_2 = solver_->make_term(2, intsort);
                            Term power2_k = solver_->make_term(Pow, two_2, k);
                            Term lt = solver_->make_term(Lt, TermVec{translate_param, power2_k});
                            Term and_term = solver_->make_term(And, TermVec{positive, lt, translate_right});
                            save_in_cache(term, solver_->make_term(Exists, TermVec{translate_param, and_term}));
                    } break;
                case Forall: { int_op = Minus;
                            Term translate_param, translate_right;
                            Term param = (*it);
                            query_cache(param, translate_param);
                            it++;
                            Term right = (*it);
                            query_cache(right, translate_right);
                            // 0 <= param < 2^k -> formula
                            Term k = get_bit_width_term(param);
                            Sort intsort = solver_->make_sort(INT);
                            Term zero =  solver_->make_term(0, intsort);
                            Term positive = solver_->make_term(Ge, TermVec{translate_param, zero});   
                            Term two_2 = solver_->make_term(2, intsort);
                            Term power2_k = solver_->make_term(Pow, two_2, k);
                            Term lt = solver_->make_term(Lt, TermVec{translate_param, power2_k});
                            Term and_term = solver_->make_term(And, TermVec{positive, lt});
                            Term formula = solver_->make_term(Implies, TermVec{and_term, translate_right});
                            save_in_cache(term, solver_->make_term(Forall, TermVec{translate_param, formula}));
                            // save_in_cache(term, std::make_shared<PBVTerm>(formula));
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
                case PIAnd: {
                    TermVec cached_children;
                    Term c;
                    int_op = Minus;
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
        Term zero =  solver_->make_term(0, intsort);
        Term positive = solver_->make_term(Gt, bit_width, zero);
        int exists = 0;
        for (Term rule : *operator_rules) {
            if(rule == positive) {
                exists = 1;
                break;
            }
        }
        if (!exists) {
            operator_rules->push_back(positive);
        }
        if (!query_cache(term, k) && term->to_string() != bit_width->to_string()){
            if (term->is_param()) {
                k = solver_->make_param("_pbv_" + term->to_string() ,intsort);
            } else if(term->is_symbol()) {
                k = solver_->make_symbol("_pbv_" + term->to_string() ,intsort);
            }
        } else {
            k = bit_width;
        }
        res = k;
        // 0 <= k <= pow2(k)
        if (term->is_symbol()) {
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
        }
      } else {
          if (term->is_value()) { // translate constant bit-vectors like: bv0
            try {
                Sort intsort = solver_->make_sort(INT);
                res = solver_->make_term(term->to_int(), intsort);
            }  catch (...) {
                res = term; 
            }
          } else {
            res = term;
          }
      }
      save_in_cache(term, res);
    }
  }
return Walker_Continue;
}

// RewritePBVWalker
WalkerStepResult RewritePBVWalker::visit_term(Term & term) {
  if (!preorder_)
  {
    Op op = term->get_op();
    if (!term->is_pbvterm() || term->get_sort()->to_string() == to_string(INT)) {
        save_in_cache(term, term);
        return Walker_Continue;
    }
    if (!op.is_null())
    {
      PrimOp primop = op.prim_op;
      auto it = term->begin();
      Term x = *it;
      Term translate_x, translate_y;
      query_cache(x, translate_x);
      Op op_x = translate_x->get_op();
      Op op_y;
      if (primop == Extract) {
        save_in_cache(term, term);
        return Walker_Continue;
      }
      if (primop != BVNeg && primop !=  BVNot  && primop != Not && primop != BVNot && primop != Zero_Extend && primop != Sign_Extend) {
        Term y = *(++it);
        if(!query_cache(y, translate_y)){
            translate_y = y;
        }
        op_y = translate_y->get_op();
      } 
      if (primop == Implies) {
        // false => y -> true
        if (!(translate_x->to_string()).compare("false")) {
            save_in_cache(term, solver_->make_term(true));
            return Walker_Continue;
        }
        // true => y -> y
        if (!(translate_x->to_string()).compare("true")) {
            save_in_cache(term, translate_y);
            return Walker_Continue;
        }
        // x => true -> true
        if (!(translate_y->to_string()).compare("true")) {
            save_in_cache(term, solver_->make_term(true));
            return Walker_Continue;
        }
      } else if (primop == And || primop == Or || primop == Not || primop == Ite || primop == Distinct) {
        TermVec cached_children;
        Term c;
        for (Term t : term)
        {
            c = t;
            query_cache(t, c);
            cached_children.push_back(c);
        }
        if (term->is_pbvterm()) {
            Term pbv = std::make_shared<PBVTerm>(op, cached_children);
            save_in_cache(term, pbv);
        } else {
            save_in_cache(term, solver_->make_term(op, cached_children));
        }
        return Walker_Continue;
      }
      Sort intsort = solver_->make_sort(INT);
      Term zero =  solver_->make_term(0, intsort);
      Term one =  solver_->make_term(1, intsort);
      Term k = get_bit_width_term(term);
      Sort bvksort = std::make_shared<PBVSort>(BV, k);
      Term bvk_zero =  std::make_shared<PBVTerm>(bvksort, TermVec{zero});
      Term bvk_one =  std::make_shared<PBVTerm>(bvksort, TermVec{one});
      Term bvk_max = std::make_shared<PBVTerm>(BVNot, TermVec{bvk_zero});
      Term bvk =  std::make_shared<PBVTerm>(bvksort, TermVec{k}); 
      if (primop == Concat) {
        if (!op_x.is_null() && !op_y.is_null()) {
            PrimOp primop_x = op_x.prim_op;
            PrimOp primop_y = op_y.prim_op;
             // (= j1 (+ j 1), (concat (extract k j1 s) (extract j i s)) -> (extract k i s)
            if (primop_x == PExtract && primop_y == PExtract) {
                auto it_x = translate_x->begin();
                Term translate_left, translate_lefti, translate_leftj;
                Term leftj = (*it_x);
                if (!query_cache(leftj, translate_leftj)) {
                    translate_leftj = leftj;
                }
                it_x++;
                Term lefti = (*it_x);
                if(!query_cache(lefti, translate_lefti)){
                    translate_lefti = lefti;
                }
                it_x++;
                Term left = (*it_x);
                if(!query_cache(left, translate_left)) {
                    translate_left = left;
                }
                auto it_y = translate_y->begin();
                Term translate_right, translate_righti, translate_rightj;
                Term rightj = (*it_y);
                if(!query_cache(rightj, translate_rightj)){
                    translate_rightj = rightj;
                }
                it_y++;
                Term righti = (*it_y);
                if(!query_cache(righti, translate_righti)){
                    translate_righti = righti;
                }
                it_y++;
                Term right = (*it_x);
                if(query_cache(right, translate_righti)) {
                    translate_righti = right;
                }
                Op op_lefti = translate_lefti->get_op();
                if (!op_lefti.is_null() && op_lefti.prim_op == Plus) {
                    auto it_lefti = translate_lefti->begin();
                    Term translate_plus_left, translate_plus_right;
                    Term plus_left = (*it_lefti);
                    if(!query_cache(plus_left, translate_plus_left)){
                        translate_plus_left = plus_left;
                    }
                    it_lefti++;
                    Term plus_right = (*it_lefti);
                    if(!query_cache(plus_right, translate_plus_right)){
                        translate_plus_right = plus_right;
                    }
                    if (translate_left == translate_righti && translate_plus_right == translate_rightj && translate_plus_right == one) {
                        Term new_extract = std::make_shared<PBVTerm>(Extract, TermVec{translate_x, translate_leftj, translate_righti});
                        save_in_cache(term, new_extract);
                        return Walker_Continue;
                    }
                }
            }
          }
      } else if (primop == PExtract) {
        Term j = (*it);
        Term translate_j = translate_x;
        Term translate_i = translate_y;
        if(!query_cache(j, translate_j)) {
            translate_j = j;
        }
        it++;
        Term ex_term = (*it);
        Term translate_ex_term;
        if(!query_cache(ex_term, translate_ex_term)) {
            translate_ex_term = ex_term;
        }
        Op op_x = translate_ex_term->get_op();
        // (extract l k (extract j i x)) -> (extract (+ i l) (+ i k) x))
        if (!op_x.is_null() && op_x.prim_op == PExtract) {
            auto it_x = x->begin();
            Term jx = (*it);
            Term translate_jx, translate_ix, translate_xx;
            if(!query_cache(jx, translate_jx)) {
                translate_jx = jx;
            }
            it_x++;
            Term ix = (*it_x);
            if(!query_cache(ix, translate_ix)) {
                translate_ix = ix;
            }
            it_x++;
            Term xx = (*it_x);
            if(!query_cache(xx, translate_xx)){
                translate_xx = xx;
            }
            Term i_plus_ix = std::make_shared<PBVTerm>(Plus, TermVec{translate_i, translate_ix});
            Term i_plus_jx = solver_->make_term(Plus, TermVec{translate_i, translate_jx});
            Term new_extract = std::make_shared<PBVTerm>(Extract, TermVec{translate_xx, translate_jx, translate_i});
            save_in_cache(term, new_extract);
            return Walker_Continue;
        } else if (op_x.is_null()) {
            Term bitwidth = get_bit_width_term(translate_ex_term);
            Term bitwidth_minus_one = std::make_shared<PBVTerm>(Minus, TermVec{translate_ex_term, one});
            // (extract n 0 x) -> x
            if (translate_i == zero && translate_j == bitwidth_minus_one) {
                save_in_cache(term, translate_ex_term);
                return Walker_Continue;
            }
        }
    //   } else if (primop == BVAdd) {
    //     // (bvadd x y) -> (bvadd y x))
    //     if (translate_x->to_string() < translate_y->to_string()) {
    //         save_in_cache(term, std::make_shared<PBVTerm>(BVAdd, TermVec{translate_y, translate_x}));
    //         return Walker_Continue;  
    //     }
    //     // (bvadd x 0) -> x
    //      if (translate_x == bvk_zero) {
    //         save_in_cache(term, translate_y);
    //         return Walker_Continue;  
    //     } else if (translate_y == bvk_zero) {
    //         save_in_cache(term, translate_x);
    //         return Walker_Continue; 
    //     }
        // (bvadd (bvmul x1 y) (bvmul x2 y))) -> (bvmul (bvadd x1 x2) y)
        // (bvadd (bvmul y x1) (bvmul y x2))) -> (bvmul y (bvadd x1 x2))
        // if (!op_x.is_null() && op_x.prim_op == BVMul && !op_y.is_null() && op_y.prim_op == BVMul) {
        //     auto x_it = x->begin();
        //     Term x_left = *x_it;
        //     Term translate_x_left;
        //     if(!query_cache(x_left, translate_x_left)){
        //         translate_x_left = x_left;
        //     }
        //     Term x_right = *(++x_it);
        //     Term translate_x_right;
        //     if(!query_cache(x_right, translate_x_right)) {
        //         translate_x_right = x_right;
        //     }
        //     auto y_it = translate_y->begin();
        //     Term y_left = *y_it;
        //     Term translate_y_left;
        //     if(!query_cache(y_left, translate_y_left)){
        //         translate_y_left = y_left;
        //     }
        //     Term y_right = *(++y_it);
        //     Term translate_y_right;
        //     if(!query_cache(y_right, translate_y_right)){
        //         translate_y_right = y_right;
        //     }
        //     if (x_left == y_left) {
        //         Term add_term = std::make_shared<PBVTerm>(BVAdd, TermVec{x_right, y_right});
        //         save_in_cache(term, std::make_shared<PBVTerm>(BVMul, TermVec{x_left, add_term}));
        //         return Walker_Continue;
        //     } else if (x_right == y_right) {
        //         Term add_term = std::make_shared<PBVTerm>(BVAdd, TermVec{x_left, y_left});
        //         save_in_cache(term, std::make_shared<PBVTerm>(BVMul, TermVec{x_right, add_term}));
        //         return Walker_Continue;
        //     }
        // }
      } else if (primop == BVMul) {
        // (bvmul x y) -> (bvmul y x))
        // if (translate_x->to_string() > translate_y->to_string()) {
        //     save_in_cache(term, std::make_shared<PBVTerm>(BVMul, TermVec{translate_y, translate_x}));
        //     return Walker_Continue;  
        // }
        // (bvmul x 1) -> x
         if (translate_x == bvk_one) {
            save_in_cache(term, translate_y);
            return Walker_Continue;  
        } else if (translate_y == bvk_one) {
            save_in_cache(term, translate_x);
            return Walker_Continue; 
        }
        // (bvmul x 0) -> 0
         else if (translate_y == bvk_zero || translate_x == bvk_zero) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue; 
        }
      } else if (primop == BVUdiv) {
        // bvudiv x 0 -> bvnot 0
        if (translate_y == bvk_zero) {
            save_in_cache(term, bvk_max);
            return Walker_Continue;  
        }
        // bvudiv 0 y -> 0
        if (translate_x == bvk_zero) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
        // bvudiv x 1 -> x
        if (translate_y == bvk_one) {
            save_in_cache(term, translate_x);
            return Walker_Continue;  
        }
      } else if (primop == BVUrem) {
        // bvurem x 1 -> x
        if (translate_y == bvk_one) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
        // bvurem x x -> 0
        if (translate_x == translate_y) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
      } else if (primop == BVNeg) {
            // (bvneg (bvsub x y)) -> (bvsub y x))
            if (op_x.prim_op == BVSub) {
                auto it_x = translate_x->begin();
                Term translate_left, translate_right;
                Term left = (*it_x);
                if(!query_cache(left, translate_left)){
                    translate_left = left;
                }
                it_x++;
                Term right = (*it_x);
                if(!query_cache(right, translate_right)){
                    translate_right = right;
                }
                save_in_cache(term, std::make_shared<PBVTerm>(BVSub, TermVec{translate_right, translate_left}));
                return Walker_Continue;  
            }
            //  (bvneg (bvneg x)) -> x
            if (op_x.prim_op == BVNeg) {
                auto it_x = translate_x->begin();
                Term translate_in_x;
                Term inx = (*it_x);
                if(!query_cache(inx, translate_in_x)){
                    translate_in_x = inx;
                }
                save_in_cache(term, translate_in_x);
                return Walker_Continue;  
            }
        } else if (primop == BVNot) {
            // bvnot (bvnot x) -> x
            if (op_x.prim_op == BVNot) {
                auto it_x = translate_x->begin();
                Term translate_in_x;
                Term inx = (*it_x);
                if(!query_cache(inx, translate_in_x)){
                    translate_in_x = inx;
                }
                save_in_cache(term, translate_in_x);
                return Walker_Continue;
            }
            // (not (bvult x y)) -> (bvule y x))
            if (op_x.prim_op == BVUlt) {
                auto it_x = translate_x->begin();
                Term translate_in_x, translate_in_y;
                Term inx = (*it_x);
                if(!query_cache(inx, translate_in_x)){
                    translate_in_x = inx;
                }
                ++it_x;;
                Term iny = (*it_x);
                if(!query_cache(iny, translate_in_y)){
                    translate_in_y = iny;
                }
                save_in_cache(term, std::make_shared<PBVTerm>(BVUle, TermVec{translate_in_y, translate_in_x}));
                return Walker_Continue;
            }
            // (not (bvule x y)) -> (bvult y x))
            if (op_x.prim_op == BVUle) {
                auto it_x = translate_x->begin();
                Term translate_in_x, translate_in_y;
                Term inx = (*it_x);
                if(!query_cache(inx, translate_in_x)){
                    translate_in_x = inx;
                }
                ++it_x;
                Term iny = (*it_x);
                if(!query_cache(iny, translate_in_y)){
                    translate_in_y = iny;
                }
                save_in_cache(term, std::make_shared<PBVTerm>(BVUlt, TermVec{translate_in_y, translate_in_x}));
                return Walker_Continue;
            }
            // (not (bvsle x y)) -> (bvslt y x))
            if (op_x.prim_op == BVSle) {
                auto it_x = translate_x->begin();
                Term translate_in_x, translate_in_y;
                Term inx = (*it_x);
                if(!query_cache(inx, translate_in_x)){
                    translate_in_x = inx;
                }
                ++it_x;
                Term iny = (*it_x);
                if(!query_cache(iny, translate_in_y)){
                    translate_in_y = iny;
                }
                save_in_cache(term, std::make_shared<PBVTerm>(BVSlt, TermVec{translate_in_y, translate_in_x}));
                return Walker_Continue;
            }
        } else if (primop == BVXor) {
            // (bvxor x y) -> (bvor y x))
            // if (translate_x->to_string() > translate_y->to_string()) {
            //     save_in_cache(term, std::make_shared<PBVTerm>(BVXor, TermVec{translate_y, translate_x}));
            //     return Walker_Continue;  
            // }
            // bvxor x x -> 0
            if (translate_x == translate_y) {
                save_in_cache(term, bvk_zero);
                return Walker_Continue;
            }
            // bvxor x (bvnot x) -> bvnot bv0
            Term not_x = std::make_shared<PBVTerm>(BVNot, TermVec{translate_x});
            Term not_y = std::make_shared<PBVTerm>(BVNot, TermVec{translate_y});
            if (not_x == translate_y || not_y == translate_x) {
                save_in_cache(term, std::make_shared<PBVTerm>(BVNot, TermVec{bvk_zero}));
                return Walker_Continue;
            }
            // bvxor x 0 -> x
            if (translate_y == bvk_zero) {
                save_in_cache(term, translate_x);
                return Walker_Continue; 
            }
            if (translate_x == bvk_zero) {
                save_in_cache(term, translate_y);
                return Walker_Continue; 
            }
            // bvxor x (bvnot 0) -> bvnot x
            if (translate_y == bvk_max) {
                save_in_cache(term, std::make_shared<PBVTerm>(BVNot, TermVec{translate_x}));
                return Walker_Continue; 
            }
            if (translate_x == bvk_max) {
                save_in_cache(term, std::make_shared<PBVTerm>(BVNot, TermVec{translate_y}));
                return Walker_Continue; 
            }
            // (bvxor (bvnot x) (bvnot y)) -> (bvxor x y))
            PrimOp primop_x = op_x.prim_op;
            PrimOp primop_y = op_y.prim_op;
            if (primop_x == BVNot && primop_y == BVNot) {
                auto it_x = translate_x->begin();
                auto it_y = translate_y->begin();
                Term translate_in_x, translate_in_y;
                Term inx = (*it_x);
                if(!query_cache(inx, translate_in_x)){
                    translate_in_x = inx;
                }
                ++it_x;
                Term iny = (*it_y);
                if(!query_cache(iny, translate_in_y)){
                    translate_in_y = iny;
                }
                save_in_cache(term, std::make_shared<PBVTerm>(BVXor, TermVec{translate_in_x, translate_in_y}));
                return Walker_Continue; 
            }
      } else if (primop == BVAnd) {
        // bvand x x -> x
        if (translate_x == translate_y) {
            save_in_cache(term, translate_x);
            return Walker_Continue;
        }
        // bvand x 0 -> 0
        if (translate_x == bvk_zero || translate_y == bvk_zero) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;
        }
    } else if (primop == BVOr) {
        // (bvor x y) -> (bvor y x))
        // if (translate_x->to_string() > translate_y->to_string()) {
        //     save_in_cache(term, std::make_shared<PBVTerm>(BVOr, TermVec{translate_y, translate_x}));
        //     return Walker_Continue;  
        // }
        // bvor x x -> x
        if (translate_x == translate_y) {
            save_in_cache(term, translate_x);
            return Walker_Continue;
        }
        // (bvor x 0) -> x
        if (translate_x == bvk_zero) {
            save_in_cache(term, translate_y);
            return Walker_Continue;  
        } else if (translate_y == bvk_zero) {
            save_in_cache(term, translate_x);
            return Walker_Continue; 
        }
        // (bvor x (bvnot 0)) -> bvnot 0
        if (translate_x == bvk_max || translate_y == bvk_max ) {
            save_in_cache(term, bvk_max);
            return Walker_Continue; 
        }
        // bvor x (bvnot x) -> bvnot 0
        Term bvnot_x = std::make_shared<PBVTerm>(BVNot, TermVec{translate_x});
        Term bvnot_y = std::make_shared<PBVTerm>(BVNot, TermVec{translate_y});
        if (translate_x  == bvnot_y || translate_y == bvnot_x ) {
            save_in_cache(term, bvk_max);
            return Walker_Continue; 
        }
      } else if (primop == PZero_Extend) {
        // (zero_extend 0 y) -> y
        if (translate_x == zero) {
            save_in_cache(term, translate_y);
            return Walker_Continue;  
        }
      }  else if (primop == PSign_Extend) {
        // (sign_extend 0 y) -> y
        if (translate_x == zero) {
            save_in_cache(term, translate_y);
            return Walker_Continue;  
        }
      } else if (primop == BVShl) {
        // (bvshl x 0) -> X
        if (translate_y == bvk_zero) {
            save_in_cache(term, translate_x);
            return Walker_Continue;  
        }
        // (bvshl 0 y) -> 0
        if (translate_x == bvk_zero) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
        // (bvshl x k)
        if (translate_y == bvk) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
      } else if (primop == BVLshr) {
        // (bvlshr x 0) -> x
        if (translate_y == bvk_zero) {
            save_in_cache(term, translate_x);
            return Walker_Continue;  
        }
        // (bvlshr 0 y) -> 0
        if (translate_x == bvk_zero) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
        // (bvlshr x k)
        if (translate_y == bvk) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
      } else if (primop == BVAshr) {
        // (bvAshr x 0) -> X
        if (translate_y == bvk_zero) {
            save_in_cache(term, translate_x);
            return Walker_Continue;  
        }
        // (bvlshr 0 y) -> 0
        if (translate_x == bvk_zero) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
        // (bvAshr x k)
        if (translate_y == bvk) {
            save_in_cache(term, bvk_zero);
            return Walker_Continue;  
        }
      } else if (primop == Equal) {
        // (= x (bvnot x)) -> false
        if (op_y.prim_op == BVNot) {
            auto it_y = translate_y->begin();
            Term translate_in_y;
            Term iny = (*it_y);
            if (!query_cache(iny, translate_in_y)) {
                translate_in_y = iny;
            }
            if (translate_in_y == translate_x) {
                save_in_cache(term, solver_->make_term(false));
                return Walker_Continue;  
            }
        }
        if (op_x.prim_op == BVNot) {
            auto it_x = translate_x->begin();
            Term translate_in_x;
            Term inx = (*it_x);
            if (!query_cache(inx, translate_in_x)) {
                translate_in_x = inx;
            }
            if (translate_in_x == translate_y) {
                save_in_cache(term, solver_->make_term(false));
                return Walker_Continue;  
            }
        }
      } else if (primop == BVUgt) {
        // (bvugt x y) -> (bvult y x))
        save_in_cache(term, std::make_shared<PBVTerm>(BVUlt, TermVec{translate_y, translate_x}));
        return Walker_Continue;  
      } else if (primop == BVUge) {
        // (bvuge x y) -> (bvule y x))
        save_in_cache(term, std::make_shared<PBVTerm>(BVUle, TermVec{translate_y, translate_x}));
        return Walker_Continue;  
      } else if (primop == BVUle) {
        // (bvule x x) -> true
        if (translate_x == translate_y) {
            save_in_cache(term, solver_->make_term(true));
            return Walker_Continue;
        }
        // (bvule 0 y) -> true ||(bvule x (bvnot 0)) -> true
        if (translate_x == bvk_zero || translate_y == bvk_max) {
            save_in_cache(term, solver_->make_term(true));
            return Walker_Continue;  
        }
        // (bvule x 0) -> (= x 0))
        if (translate_y == bvk_zero) {
            save_in_cache(term, std::make_shared<PBVTerm>(Equal, TermVec{translate_x, bvk_zero}));
            return Walker_Continue;  
        }
      } else if (primop == BVUlt) {
        // (bvult 0 y) -> (not (= y 0))
        if (translate_x == bvk_zero) {
            save_in_cache(term, std::make_shared<PBVTerm>(Distinct, TermVec{translate_y, bvk_zero}));
            return Walker_Continue;  
        }
        // (bvult x 1) -> (= x 0))
        if (translate_y == bvk_one) {
            save_in_cache(term, std::make_shared<PBVTerm>(Equal, TermVec{translate_x, bvk_zero}));
            return Walker_Continue;  
        }
        // (bvult x 0) -> false ||  (bvult x x) -> false
        if (translate_y == bvk_zero || translate_x == translate_y) {
            save_in_cache(term, solver_->make_term(false));
            return Walker_Continue;  
        }
      } else if (primop == BVSgt) {
        // (bvsgt x y) -> (bvslt y x))
        save_in_cache(term, std::make_shared<PBVTerm>(BVSlt, TermVec{translate_y, translate_x}));
        return Walker_Continue;  
      } else if (primop == BVSge) {
        // (bvsge x y) -> (bvsle y x))
        save_in_cache(term, std::make_shared<PBVTerm>(BVSle, TermVec{translate_y, translate_x}));
        return Walker_Continue;  
      }  else if (primop == BVSle) {
        // (bvule x x) -> true
        if (translate_x == translate_y) {
            save_in_cache(term, solver_->make_term(true));
            return Walker_Continue;  
        }
      } else if (primop == BVSlt) {
        // (bvslt x x) -> false
        if (translate_x == translate_y) {
            save_in_cache(term, solver_->make_term(false));
            return Walker_Continue;  
        }
      }
      TermVec cached_children;
      Term c;
      for (Term t : term)
      {
        c = t;
        query_cache(t, c);
        cached_children.push_back(c);
      }
      if (term->is_pbvterm()) {
        Term pbv = std::make_shared<PBVTerm>(op, cached_children);
        save_in_cache(term, pbv);
      } else {
        save_in_cache(term, solver_->make_term(op, cached_children));
      }
    } else {
        save_in_cache(term, term);
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
        Term translate_x, translate_y;
        query_cache(x, translate_x);
        it++;
        Term y = (*it);
        query_cache(y, translate_y);
        Term k = get_bit_width_term(translate_x);
        Sort intsort = solver_->make_sort(INT);
        Term one =  solver_->make_term(1, intsort);
        Sort bv1 = solver_->make_sort(BV, 1);
        Term k_minus_one = solver_->make_term(Minus, k, one);
        Term extract_bit = std::make_shared<PBVTerm>(Extract, TermVec{translate_x, k_minus_one, k_minus_one});
        int64_t int_zero = 0;
        Term const_bit_zero = solver_->make_term(int_zero, bv1);
        Term condition = std::make_shared<PBVTerm>(Equal, TermVec{extract_bit, const_bit_zero});
        Term then_branch = std::make_shared<PBVTerm>(BVLshr, TermVec{translate_x, translate_y});
        Term bvnot = std::make_shared<PBVTerm>(BVNot, TermVec{translate_x});
        Term bvlshr_bvnot = std::make_shared<PBVTerm>(BVLshr, TermVec{bvnot, translate_y});
        Term else_branch = std::make_shared<PBVTerm>(BVNot, TermVec{bvlshr_bvnot});
        Term ite = std::make_shared<PBVTerm>(Ite, TermVec{condition, then_branch, else_branch});
        save_in_cache(term, ite);
      } else if (primop == BVSub && this->bvsub) {
        Term x = (*it);
        it++;
        Term y = (*it);
        Term neg_y = std::make_shared<PBVTerm>(BVNeg, TermVec{y});
        Term bvadd = std::make_shared<PBVTerm>(BVAdd, TermVec{x, neg_y});
        save_in_cache(term, bvadd);
      } else if (primop == PZero_Extend) {
        Term k = (*it);
        Term translate_x, translate_k;
        query_cache(k, translate_k);
        it++;
        Term x = (*it);
        query_cache(x, translate_x);
        Sort intsort = solver_->make_sort(INT);
        Term zero = solver_->make_term(0, intsort);
        Sort k_width = std::make_shared<PBVSort>(BV, translate_k);
        Term zero_term = std::make_shared<PBVTerm>(k_width, TermVec{zero});
        Term zero_extend = std::make_shared<PBVTerm>(Concat, TermVec{zero_term, translate_x});
        save_in_cache(term, zero_extend);
      } else if (primop == PSign_Extend) {
        // (psign_extend k x) = ite(sign_bit = 1 (concat 11...1 x) (concat 00...0 x)) 
        Term k = (*it);
        Term translate_x, translate_k;
        query_cache(k, translate_k);
        it++;
        Term x = (*it);
        query_cache(x, translate_x);
        Sort intsort = solver_->make_sort(INT);
        Term one = solver_->make_term(1, intsort);
        Term zero = solver_->make_term(0, intsort);
        Sort bv1 = solver_->make_sort(BV, 1);
        Sort k_width = std::make_shared<PBVSort>(BV, translate_k);
        Term zero_term = std::make_shared<PBVTerm>(k_width, TermVec{zero});
        int64_t int_one = 1;
        Term one_term = solver_->make_term(int_one, bv1);
        Term zero_extend = std::make_shared<PBVTerm>(Concat, TermVec{zero_term, translate_x});
        Term max_int = std::make_shared<PBVTerm>(BVNot, TermVec{zero_term});
        Term sign_extend = std::make_shared<PBVTerm>(Concat, TermVec{max_int, translate_x});
        Term x_width = get_bit_width_term(translate_x);
        Term x_width_minus_one = solver_->make_term(Minus, x_width, one);
        Term sign_bit = std::make_shared<PBVTerm>(Extract, TermVec{translate_x, x_width_minus_one, x_width_minus_one});
        Term condition = std::make_shared<PBVTerm>(Equal, TermVec{sign_bit, one_term});
        Term ite = std::make_shared<PBVTerm>(Ite, TermVec{condition, sign_extend, zero_extend});
        save_in_cache(term, ite);
      } else if (primop == PExtract) {
        Term j = (*it);
        Term translate_x, translate_i, translate_j;
        query_cache(j, translate_j);
        it++;
        Term i = (*it);
        query_cache(i, translate_i);
        it++;
        Term x = (*it);
        query_cache(x, translate_x);
        Term extract = std::make_shared<PBVTerm>(Extract, TermVec{translate_x, translate_j, translate_i});
        save_in_cache(term, extract);
      } else if (primop == Extract) {
        Sort intsort = solver_->make_sort(INT);
        Term j = solver_->make_term(op.idx0, intsort);
        Term i = solver_->make_term(op.idx1, intsort);
        Term translate_x;
        Term x = (*it);
        query_cache(x, translate_x);
        Term extract = std::make_shared<PBVTerm>(Extract, TermVec{translate_x, j, i});
        save_in_cache(term, extract);
      } else {
        TermVec cached_children;
        Term c;
        for (Term t : term)
        {
            c = t;
            query_cache(t, c);
            cached_children.push_back(c);
        }
        if (term->is_pbvterm()) {
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
               if ((left->to_string()).substr(1, 3) != "div") {
                    return left;
             } else {

                    return x;

             }
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
        Term translate_x, translate_y;
        Term x = (*it);
        query_cache(x, translate_x);
        it++;
        Term y = (*it);
        query_cache(y, translate_y);
        if ((translate_x->to_string()).substr(1, 3) != "div" && (translate_x->to_string()).substr(1, 2) != "^") {
            Op x_op = translate_x->get_op();
            PrimOp x_primop = x_op.prim_op;
            if (!x_op.is_null() && (x_primop == Plus || x_primop == Minus || x_primop == Mult)) {
                Term ef_x, ef_left, ef_right;
                query_cache(x ,ef_x);
                auto x_it = ef_x->begin();
                Term left = *x_it;
                x_it++;
                Term right = *x_it;
                Sort intsort = solver_->make_sort(INT);
                Term zero = solver_->make_term(0, intsort);
                if (x_primop == Mult && (left == zero || right == zero)) {
                    save_in_cache(term, zero);
                    return Walker_Continue;
                } else if (isOp(left, Ite)) {
                    auto ite_it = left->begin();
                    Term condition = *ite_it;
                    ++ite_it;
                    Term then_branch =  *ite_it;
                    ++ite_it;
                    Term else_branch =  *ite_it;
                    ef_left = solver_->make_term(Ite, condition, rmMod(then_branch, y), rmMod(else_branch, translate_y));
                } else {
                    ef_left = rmMod(left, translate_y);
                }
                cached_children.push_back(ef_left);
                if (isOp(right, Ite)) {
                    auto ite_it = right->begin();
                    Term condition = *ite_it;
                    ++ite_it;
                    Term then_branch =  *ite_it;
                    ++ite_it;
                    Term else_branch =  *ite_it;
                    ef_right = solver_->make_term(Ite, condition, rmMod(then_branch, translate_y), rmMod(else_branch, translate_y));
                } else {
                    ef_right = rmMod(right, translate_y);
                }
                cached_children.push_back(ef_right);
                Term ef_term = solver_->make_term(x_op, cached_children);
                Term trans = solver_->make_term(op, TermVec{ef_term, translate_y});
                save_in_cache(term, trans);
                return Walker_Continue;
            }
        } else {
            for (auto t : term)
            {
            c = t;
            query_cache(t, c);
            cached_children.push_back(c);
            }
            save_in_cache(term, solver_->make_term(op, cached_children));
            return Walker_Continue;
        }
      } else if (primop == Equal || primop == Distinct) { // s = s*s mod 2^n -> s <= 1
        auto it = term->begin();
        Term x = (*it);
        it++;
        Term y = (*it);
        if ((y->to_string()).substr(1, 3) == "div") {
            save_in_cache(term, term);
            return Walker_Continue;
        }
        Op y_op = y->get_op();
        if (!y_op.is_null()) {
            PrimOp y_primop = y_op.prim_op;
            if (y_primop == Mod) {
                auto y_it = y->begin();
                Term inmod = *y_it;
                if ((inmod->to_string()).substr(1, 3) == "div") {
                    save_in_cache(term, term);
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
                        term_rules->push_back(implies);
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
    TermVec cached_children;
    Term c;
    for (auto t : term)
        {
            c = t;
            query_cache(t, c);
            cached_children.push_back(c);
        }
        save_in_cache(term, solver_->make_term(IntDiv, cached_children));
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
        // TODO: see if we can pass the same term as both arguments
        c = t;
        query_cache(t, c);
        cached_children.push_back(c);
      }
      if (op == Distinct) {
        Term eq = solver_->make_term(Equal, cached_children);
        save_in_cache(term, solver_->make_term(Not, eq));
      } else {
        save_in_cache(term, solver_->make_term(op, cached_children));
      }
    }
    else
    {
     Term res;
      // change bv, k ---> bv, 4
      if(term->is_pbvterm()) {
        std::string const_val = std::to_string( this->bw);
        Sort s = term->get_sort();
        mp[term->to_string()] = s;
        shared_ptr<PBVSort> pbvs = static_pointer_cast<PBVSort>(s);
        Sort bvsort = solver_->make_sort(BV, this->bw);
        try {
            res = solver_->make_term(stoi(term->to_string()), bvsort);
        } catch (...) {
            if (term->is_param()) {
               res = solver_->make_param(term->to_string() + "_" + const_val + "." + std::to_string(rand()), bvsort);
            } else if(term->is_symbol()) {
                    res = solver_->make_symbol(term->to_string() + "_" + const_val + "." + std::to_string(rand()), bvsort);
                // }
            } else {
                res = solver_->make_symbol(term->to_string() + "_" + const_val + "." + std::to_string(rand()), bvsort);
            }
        }
      } else {
        res = term;
      }
      save_in_cache(term, res);
    }
  }
return Walker_Continue;
}

void print_map(){
    map<string, Sort>::iterator it = mp.begin();
    // Iterate through the map and print the elements
    while (it != mp.end()) {
        cout << "Key: " << it->first
             << ", Value: " << it->second << endl;
        ++it;
    }
}

// PBVParametricWalker function
WalkerStepResult PBVParametricWalker::visit_term(Term & term) {
  if (!preorder_)
  {
    Op op = term->get_op();
    if (!op.is_null())
    {
      int count = 0; 
      TermVec cached_children;
      Term c, third, four;
      for (auto t : term)
      {
        // TODO: see if we can pass the same term as both arguments
        c = t;
        query_cache(t, c);
        cached_children.push_back(c);
        count++;
        if (count == 3) {
            third = c;
        }
        if (count == 4) {
            four = c;
        }
      }
      if((op == BVAnd || op == BVOr || op == BVXor || op == BVAdd || op == BVSub) && count == 3) {
        Term tran = std::make_shared<PBVTerm>(op, cached_children);
        Term tran2 = std::make_shared<PBVTerm>(op, TermVec{tran, third});
        save_in_cache(term, tran2);
      } else {
        Term tran = std::make_shared<PBVTerm>(op, cached_children);
        save_in_cache(term, tran);
      }
    }
    else
     {
      Term res;
      Sort s = term->get_sort();
      // change bv, 4 ---> bv, k
      if(s->get_sort_kind() == BV) {
        try {
            if (mp.find(std::to_string(term->to_int())) != mp.end()) {
                res = solver_->make_term(term->to_int(), mp[std::to_string(term->to_int())]);
            } else {
                res = solver_->make_term(term->to_int(), (mp.begin())->second);
            }
        } catch (...) {
            size_t pos = (term->to_string()).rfind('_');
            std::string name = (term->to_string()).substr(0, pos);
            if (term->is_param()) {
               res = std::make_shared<PBVTerm>(name, mp[name], true);
            } else if(term->is_symbol()) {
                res = std::make_shared<PBVTerm>(name, mp[name]);
            } else {
                size_t pos = (term->to_string()).rfind('_');
                std::string name = (term->to_string()).substr(0, pos);
                res = std::make_shared<PBVTerm>(name, mp[name]);
            }
        } 
      } else {
          res = term;
      }
      save_in_cache(term, res);
    }
  }
return Walker_Continue;
}

}  // namespace smt