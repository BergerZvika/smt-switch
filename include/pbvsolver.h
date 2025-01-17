#include "solver.h"
#include "sort_inference.h"
#include "identity_walker.h"
#include "pbvterm.h"
#include "pbvsort.h"

#pragma once

using namespace std;

namespace smt {

  // PBVWalker
  class AbstractPBVWalker : public IdentityWalker
{
  protected:
    TermVec* term_rules;
    TermVec* operator_rules;
    Term two, bvand, k, x, y;
    int piand = 0;
    int nonpure = 0;
  public:
    AbstractPBVWalker(const SmtSolver & solver,TermVec* term_rules,TermVec* operator_rules, const Term & power2) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {
      this->term_rules = term_rules;
      this->operator_rules = operator_rules;
      Sort sort = solver->make_sort(INT);
      this->two = solver->make_term(2, sort);
    }

    WalkerStepResult visit_term(Term & term);

    void make_bit_width_term(TermIter it);
    Term extractSort(Term t);
    Term uts(Term t);
    Term bvlshr(Term t_left, Term t_right);
    Term bvnot(Term t);
    Term extract(Term x, Term i, Term j);
    Term get_bit_width_term(Term t);
    bool minimum_sign(TermIter it);
    virtual void bvand_handle() = 0;
    Term bvand_fullaxiom();
    Term bvand_basecase();
    Term bvand_max();
    Term bvand_min();
    Term bvand_idempotence();
    Term bvand_contradiction();
    Term bvand_symmetry();
    Term bvand_difference();
    Term bvand_min_range();
    Term bvand_max_range();
};

class PBVWalker : public AbstractPBVWalker
{
  protected:
    int singlenton_axiom = 0;
  public:
    PBVWalker(const SmtSolver & solver,TermVec* term_rules,TermVec* operator_rules, const Term & power2) 
        : AbstractPBVWalker(solver, term_rules, operator_rules, power2) {
        Sort intsort = solver->make_sort(INT);
        Sort funsort = solver->make_sort(FUNCTION, SortVec{intsort, intsort, intsort, intsort});
        this->bvand = solver->make_symbol("bvand", funsort);
        this->k = solver->make_param("k", intsort);
        this->x = solver->make_param("x", intsort);
        this->y = solver->make_param("y", intsort);
      }
      void bvand_handle();
};

class PartialPBVWalker : public AbstractPBVWalker
{
  protected:
    int singlenton_axiom = 0;
  public:
    PartialPBVWalker(const SmtSolver & solver,TermVec* term_rules,TermVec* operator_rules, const Term & power2) 
        : AbstractPBVWalker(solver, term_rules, operator_rules, power2) {
        Sort intsort = solver->make_sort(INT);
        Sort funsort = solver->make_sort(FUNCTION, SortVec{intsort, intsort, intsort, intsort});
        this->bvand = solver->make_symbol("bvand", funsort);
        this->k = solver->make_param("k", intsort);
        this->x = solver->make_param("x", intsort);
        this->y = solver->make_param("y", intsort);
      }
      void bvand_handle();
};

  class FullPBVWalker : public AbstractPBVWalker
{
  protected:
    int singlenton_axiom = 0;
  public:
    FullPBVWalker(const SmtSolver & solver,TermVec* term_rules,TermVec* operator_rules, const Term & power2) 
        : AbstractPBVWalker(solver, term_rules, operator_rules, power2) {
          Sort intsort = solver->make_sort(INT);
          Sort funsort = solver->make_sort(FUNCTION, SortVec{intsort, intsort, intsort, intsort});
          this->bvand = solver->make_symbol("bvand", funsort);
          this->k = solver->make_param("k", intsort);
          this->x = solver->make_param("x", intsort);
          this->y = solver->make_param("y", intsort);
        }

    void bvand_handle();
};

  class EfficientPBVWalker : public AbstractPBVWalker
{
  public:
    EfficientPBVWalker(const SmtSolver & solver,TermVec* term_rules,TermVec* operator_rules, const Term & power2) 
        : AbstractPBVWalker(solver, term_rules, operator_rules, power2) {
          this->piand = 1;
          Sort intsort = solver->make_sort(INT);
          Sort funsort = solver->make_sort(FUNCTION, SortVec{intsort, intsort, intsort, intsort});
          this->bvand = solver->make_symbol("bvand", funsort);
          this->k = solver->make_param("k", intsort);
          this->x = solver->make_param("x", intsort);
          this->y = solver->make_param("y", intsort);
        }
    void bvand_handle();
};

  class NonPurePBVWalker : public EfficientPBVWalker
{
  public:
    NonPurePBVWalker(const SmtSolver & solver,TermVec* term_rules,TermVec* operator_rules, const Term & power2) 
        : EfficientPBVWalker(solver, term_rules, operator_rules, power2) {
          this->nonpure = 1;
        }
    void bvand_handle();
};

class TypeCheckerWalker : public AbstractPBVWalker
{
  public:
    TypeCheckerWalker(const SmtSolver & solver,TermVec* term_rules,TermVec* operator_rules, const Term & power2) 
     : AbstractPBVWalker(solver, term_rules, operator_rules, power2) {
      Sort intsort = solver->make_sort(INT);
      Sort funsort = solver->make_sort(FUNCTION, SortVec{intsort, intsort, intsort, intsort});
      this->bvand = solver->make_symbol("type_check_bvand", funsort);
      this->k = solver->make_param("type_check_k", intsort);
      this->x = solver->make_param("type_check_x", intsort);
      this->y = solver->make_param("type_check_y", intsort);
    }

    void bvand_handle();
};

// PBVConstantWalker
class PBVConstantWalker : public IdentityWalker
{
  private:
    int bw = 4;
  public:
    PBVConstantWalker(const SmtSolver & solver, int k) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {
      this->bw = k;
    }

    WalkerStepResult visit_term(Term & term) override;  
};

// PBVConstantWalker
class PBVParametricWalker : public IdentityWalker
{
  public:
    PBVParametricWalker(const SmtSolver & solver) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {
    }

    WalkerStepResult visit_term(Term & term) override;  
};

// PrePBVWalker
class PrePBVWalker : public IdentityWalker
{
  protected:
      int bvsub = 0;
  public:
    PrePBVWalker(const SmtSolver & solver) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {}
    PrePBVWalker(const SmtSolver & solver, int bvsub) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {
        this->bvsub = bvsub;
    }
    WalkerStepResult visit_term(Term & term) override; 
    Term get_bit_width_term(Term t);
};

// RewritePBVWalker
class RewritePBVWalker : public IdentityWalker
{
  protected:
      int bvsub = 0;
  public:
    RewritePBVWalker(const SmtSolver & solver) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {}
    RewritePBVWalker(const SmtSolver & solver, int bvsub) :  smt::IdentityWalker(solver, true, new UnorderedTermMap()) {
        this->bvsub = bvsub;
    }
    WalkerStepResult visit_term(Term & term) override;
    Term get_bit_width_term(Term t);
};

// PostPBVWalker
class PostPBVWalker : public IdentityWalker
{
  TermVec* term_rules;
  public:
    PostPBVWalker(const SmtSolver & solver, TermVec* term_rules)  : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {
      this->term_rules = term_rules;
    }
    WalkerStepResult visit_term(Term & term) override; 
};


// AbstractPBVSolver
class AbstractPBVSolver : public AbsSmtSolver
{
  protected:
   SmtSolver wrapped_solver;
   Term power2;
   TermVec term_rules;
   TermVec operator_rules;
   AbstractPBVWalker* walker;
   int debug = 0;
   int postwalk = 0;
   int type_check = 0;
   int translate = 0;
   int bvsub = 0;
   int simplify_num = 0;
   int rewrite = 0;
  public:
    AbstractPBVSolver(SmtSolver s);
    AbstractPBVSolver(SmtSolver s, int debug);
    ~AbstractPBVSolver(){};

    // implemented
    Sort make_sort(const std::string name, uint64_t arity) const override;
    Sort make_sort(const SortKind sk) const override;
    Sort make_sort(const SortKind sk, uint64_t size) const override;
    Sort make_sort(const SortKind sk, const Sort & sort1) const override;
    Sort make_sort(const SortKind sk,
                    const Sort & sort1,
                    const Sort & sort2) const override;
    Sort make_sort(const SortKind sk,
                    const Sort & sort1,
                    const Sort & sort2,
                    const Sort & sort3) const override;
    Sort make_sort(const SortKind sk, const SortVec & sorts) const override;
    Sort make_sort(const Sort & sort_con, const SortVec & sorts) const override;
    Sort make_sort(const DatatypeDecl & d) const override;

    DatatypeDecl make_datatype_decl(const std::string & s) override;
    DatatypeConstructorDecl make_datatype_constructor_decl(
        const std::string s) override;
    void add_constructor(DatatypeDecl & dt, const DatatypeConstructorDecl & con) const override;
    void add_selector(DatatypeConstructorDecl & dt, const std::string & name, const Sort & s) const override;
    void add_selector_self(DatatypeConstructorDecl & dt, const std::string & name) const override;
    Term get_constructor(const Sort & s, std::string name) const override;
    Term get_tester(const Sort & s, std::string name) const override;
    Term get_selector(const Sort & s, std::string con, std::string name) const override;

    Term make_term(bool b) const override;
    Term make_term(int64_t i, const Sort & sort) const override;
    Term make_term(const std::string val,
                    const Sort & sort,
                    uint64_t base = 10) const override;
    Term make_term(const Term & val, const Sort & sort) const override;
    Term make_symbol(const std::string name, const Sort & sort) override;
    Term get_symbol(const std::string & name) override;
    Term make_param(const std::string name, const Sort & sort) override;
    Term make_term(const Op op, const Term & t) const override;
    Term make_term(const Op op, const Term & t0, const Term & t1) const override;
    Term make_term(const Op op,
                    const Term & t0,
                    const Term & t1,
                    const Term & t2) const override;
    Term make_term(const Op op, const TermVec & terms) const override;
    Term get_value(const std::string & name) const ;
    Term get_value(const Term & t) const override;
    UnorderedTermMap get_array_values(const Term & arr,
                                        Term & out_const_base) const override;
    void get_unsat_assumptions(UnorderedTermSet & out) override;
    // Will probably remove this eventually
    // For now, need to clear the hash table
    void reset() override;

    // dispatched to underlying solver
    void set_opt(const std::string option, const std::string value) override;
    void set_logic(const std::string logic) override;
    Result check_sat() override;
    Result check_sat_assuming(const TermVec & assumptions) override;
    Result check_sat_assuming_list(const TermList & assumptions) override;
    Result check_sat_assuming_set(const UnorderedTermSet & assumptions) override;
    void push(uint64_t num = 1) override;
    void pop(uint64_t num = 1) override;
    uint64_t get_context_level() const override;
    void reset_assertions() override;

    // pbvsolver function
    virtual Term make_term(const Sort & pbvsort, const Term & val) const;
    virtual Sort make_sort(const SortKind sk, const Term & t) const;
    Term make_pbv_symbol(const std::string & name, const Sort & s) const;
    Term make_pbv_param(const std::string & name, const Sort & s) const;
    virtual void assert_formula(const Term & t) = 0;
    Term translate_term( const Term & t);
    Term simplify(const Term& t) override;
    int check_simplify(const Term& t);
    Term substitute(const Term term,
                  const UnorderedTermMap & substitution_map);
};


// PBVSolver
class PBVSolver : public AbstractPBVSolver
{
    public:
    PBVSolver(SmtSolver s);
    PBVSolver(SmtSolver s, int debug);
    PBVSolver(SmtSolver s, int debug, int walker);
    PBVSolver(SmtSolver s, int debug, int walker, int postwalk);
    PBVSolver(SmtSolver s, int debug, int walker, int postwalk, int type_check);
    PBVSolver(SmtSolver s, int debug, int walker, int postwalk, int type_check, int translate);
    PBVSolver(SmtSolver s, int debug, int walker, int postwalk, int type_check, int translate, int pbvsub);
    PBVSolver(SmtSolver s, int debug, int walker, int postwalk, int type_check, int translate, int pbvsub, int simplify_num);
    PBVSolver(SmtSolver s, int debug, int walker, int postwalk, int type_check, int translate, int pbvsub, int simplify_num, int rewrite);
    ~PBVSolver(){};

    void assert_formula(const Term & t) override;
};

} // namespace smt