#include "pbvsort.h"

namespace smt {

PBVSort::PBVSort(SortKind sk1, Term t1) : sk(sk1), t(t1) { }

Term PBVSort::get_term() const {
    return t;
}

SortKind PBVSort::get_sort_kind() const {
    return sk;
}


}