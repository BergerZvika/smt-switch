#include "term.h"

namespace smt {
// public AbsTerm
class PBVTerm : public AbsTerm
{
  protected:
    Sort s;
    Op op;
    TermVec children;
    std::string repr;
    bool is_sym;
    std::hash<std::string> str_hash;
    size_t id_;

  public:
    PBVTerm(Sort s1, TermVec t);
    PBVTerm(Term t);
    PBVTerm(Sort s1, Op op1, TermVec t);
    PBVTerm(Op op1, TermVec t);
    PBVTerm(std::string name, TermVec t);
    PBVTerm(std::string name, Sort s1);

    ~PBVTerm(){};

    // absTerm implement
    std::size_t get_id() const override;
    bool is_param() const override;
    bool is_symbolic_const() const override;
    bool is_value() const override;
    uint64_t to_int() const override;
    std::string print_value_as(SortKind sk) override;
    // bool is_pbvterm() const override;

    // pbvterm
    Sort get_sort() const;
    Op get_op() const;
    bool is_symbol() const;
    size_t hash() const override;
    TermIter begin() override;
    TermIter end() override;

    bool compare(const Term & t) const;
    std::string compute_string() const;
    std::string to_string();

    friend class PBVSolver;
  };
  
class PBVTermIter : public TermIterBase
{
  public:
    PBVTermIter(TermVec::iterator i);
    PBVTermIter(const PBVTermIter & pbvit);
    ~PBVTermIter();
    PBVTermIter & operator=(const PBVTermIter & pbvit);
    void operator++() override;
    const Term operator*() override;
    TermIterBase * clone() const override;
    bool operator==(const PBVTermIter & pbvit);
    bool operator!=(const PBVTermIter & pbvit);

  protected:
    bool equal(const TermIterBase & other) const override;
    TermVec::iterator it;
};


}