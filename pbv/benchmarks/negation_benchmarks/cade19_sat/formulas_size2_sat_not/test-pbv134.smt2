(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvule s (bvlshr t (int_to_pbv k 0))) (bvule s t))))
(check-sat)
(exit)