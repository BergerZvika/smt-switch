(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt s (bvlshr t (int_to_pbv k 1))) (bvslt s t)))
(check-sat)
(exit)