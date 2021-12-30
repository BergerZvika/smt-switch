#include "sort.h"
#include "exceptions.h"

namespace smt {

class PBVSort : public AbsSort
{
  protected:
    SortKind sk;
    Term t;

    friend class PBVSolver;

  public:
    PBVSort(SortKind sk, Term t);
    ~PBVSort(){};
    Term get_term() const;

    // implements
    SortKind get_sort_kind() const override;
    
  // throw not implemented exception
  // for specific getters (will be
  // implemented by a subclass)
  bool compare(const Sort & s) const override {
    throw NotImplementedException(
        "compare not implemented by generic LoggingSort");
  }
    // dispatch to underlying sort
    std::size_t hash() const override {
    throw NotImplementedException(
        "hash not implemented by generic LoggingSort");
  }

  uint64_t get_width() const override
  {
    throw NotImplementedException(
        "get_width not implemented by generic LoggingSort");
  }

  Sort get_indexsort() const override
  {
    throw NotImplementedException(
        "get_indexsort not implemented by generic LoggingSort");
  }

  Sort get_elemsort() const override
  {
    throw NotImplementedException(
        "get_elemsort not implemented by generic LoggingSort");
  }

  SortVec get_domain_sorts() const override
  {
    throw NotImplementedException(
        "get_domain_sorts not implemented by generic LoggingSort");
  }

  Sort get_codomain_sort() const override
  {
    throw NotImplementedException(
        "get_codomain_sort not implemented by generic LoggingSort");
  }

  std::string get_uninterpreted_name() const override
  {
    throw NotImplementedException(
        "get_uninterpreted_name not implemented by generic LoggingSort");
  }

  size_t get_arity() const override
  {
    throw NotImplementedException(
        "get_arity not implemented by generic LoggingSort");
  }

  SortVec get_uninterpreted_param_sorts() const override
  {
    throw NotImplementedException(
        "get_uninterpreted_param_sorts not implemented by generic LoggingSort");
  }

  Datatype get_datatype() const override
  {
    throw NotImplementedException(
        "get_datatype not implemented by generic LoggingSort");
  }

};

}