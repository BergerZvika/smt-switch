#include "pbvsort.h"
#include "pbvterm.h"

namespace smt {

    PBVSort::PBVSort(SortKind sk1, Term t1) : sk(sk1), t(t1) {
        Term term = std::make_shared<PBVTerm>(t);
        pbvsort = term->to_string();
     }

    Term PBVSort::get_term() const {
        return t;
    }

    SortKind PBVSort::get_sort_kind() const {
        return sk;
    }

    size_t PBVSort::hash() const {
        Term term = std::make_shared<PBVTerm>(t);
        return term->hash();
    }

    bool PBVSort::compare(const Sort & s) const {
            if(this->to_string().compare(s->to_string()) == 0) {
                return true;
            }
        return false;
    }


}