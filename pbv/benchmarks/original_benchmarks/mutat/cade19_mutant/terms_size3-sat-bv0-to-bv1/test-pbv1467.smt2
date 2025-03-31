(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s (bvlshr t s)) t) (int_to_pbv k 1)))
(check-sat)
(exit)