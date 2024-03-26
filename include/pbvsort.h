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
    std::size_t hash() const override;
    bool compare(const Sort & s) const override;
    
  // throw not implemented exception
  // for specific getters (will be
  // implemented by a subclass)
  
    
  uint64_t get_width() const override
  {
    return -1;
  }

  Sort get_indexsort() const override
  {
    throw NotImplementedException(
        "get_indexsort not implemented by generic PBVSort");
  }

  Sort get_elemsort() const override
  {
    throw NotImplementedException(
        "get_elemsort not implemented by generic PBVSort");
  }

  SortVec get_domain_sorts() const override
  {
    throw NotImplementedException(
        "get_domain_sorts not implemented by generic PBVSort");
  }

  Sort get_codomain_sort() const override
  {
    throw NotImplementedException(
        "get_codomain_sort not implemented by generic PBVSort");
  }

  std::string get_uninterpreted_name() const override
  {
    throw NotImplementedException(
        "get_uninterpreted_name not implemented by generic PBVSort");
  }

  size_t get_arity() const override
  {
    throw NotImplementedException(
        "get_arity not implemented by generic PBVSort");
  }

  SortVec get_uninterpreted_param_sorts() const override
  {
    throw NotImplementedException(
        "get_uninterpreted_param_sorts not implemented by generic PBVSort");
  }

  Datatype get_datatype() const override
  {
    throw NotImplementedException(
        "get_datatype not implemented by generic PBVSort");
  }

};

}