#include "solver.h"
#include "sort_inference.h"
#include "identity_walker.h"
#include "pbvterm.h"
#include "pbvsort.h"

using namespace std;

namespace smt {

  // PBVWalker
  class PBVWalker : public IdentityWalker
{
  TermVec* term_rules;
  TermVec* operator_rules;
  Term two, bvand;
  public:
    PBVWalker(const SmtSolver & solver,TermVec* term_rules,TermVec* operator_rules, const Term & power2) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {
      this->term_rules = term_rules;
      this->operator_rules = operator_rules;
      Sort intsort = solver->make_sort(INT);
      this->two = solver->make_term(2, intsort);
      Sort funsort = solver->make_sort(FUNCTION, SortVec{intsort, intsort, intsort, intsort});
      this->bvand = solver->make_symbol("bvand", funsort);
      // cout << 1 << endl;
      // operator_rules->push_back(bvand_axiom());
      // cout << 2 << endl;
    }

    WalkerStepResult visit_term(Term & term) override;

    Term make_bit_width_term(TermIter it);
    Term get_bit_width_term(TermIter it);
    Term bvand_axiom();

    
};

// PBVConstantWalker
class PBVConstantWalker : public IdentityWalker
{
  public:
    PBVConstantWalker(const SmtSolver & solver) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {}

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
   PBVWalker* walker;
   int debug = 0;
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

    virtual void assert_formula(const Term & t) = 0;

    Term translate_term( const Term & t);
};


// PBVSolver
class PBVSolver : public AbstractPBVSolver
{
    public:
    PBVSolver(SmtSolver s);
    PBVSolver(SmtSolver s, int debug);
    ~PBVSolver(){};

    void assert_formula(const Term & t) override;
};


// PBVSolver
class EfficientPBVSolver : public AbstractPBVSolver
{
    public:
    EfficientPBVSolver(SmtSolver s);
    EfficientPBVSolver(SmtSolver s, int debug);
    ~EfficientPBVSolver(){};

    void assert_formula(const Term & t) override;
};

} // namespace smt