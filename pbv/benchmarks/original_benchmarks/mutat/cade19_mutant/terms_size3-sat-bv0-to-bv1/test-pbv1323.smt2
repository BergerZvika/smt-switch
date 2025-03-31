(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvlshr s t) (bvlshr t s)) (int_to_pbv k 1)))
(check-sat)
(exit)