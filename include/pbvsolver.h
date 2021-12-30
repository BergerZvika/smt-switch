#include "solver.h"
#include "sort_inference.h"
#include "identity_walker.h"

namespace smt {

class PBVSolver : public AbsSmtSolver
{
  protected:
   SmtSolver wrapped_solver;

  public:
    PBVSolver(SmtSolver s);
    ~PBVSolver(){};

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
    void assert_formula(const Term & t) override;
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

    Term translate_term( const Term & t) const;
};

class PBVWalker : public IdentityWalker
{
  public:
    PBVWalker(const SmtSolver & solver) : smt::IdentityWalker(solver, true, new UnorderedTermMap()) {}

    WalkerStepResult visit_term(Term & term) override;
    
};

} // namespace smt