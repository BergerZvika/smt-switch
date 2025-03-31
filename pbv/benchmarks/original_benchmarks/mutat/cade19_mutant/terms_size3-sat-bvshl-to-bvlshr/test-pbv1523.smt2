(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvlshr (bvnot (int_to_pbv k 0)) s) t) (bvshl (bvlshr t s) s)))
(check-sat)
(exit)