(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvand s t) (bvlshr t s)) (int_to_pbv k 0)))
(check-sat)
(exit)