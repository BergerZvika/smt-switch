(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle s (bvlshr t (int_to_pbv k 1))) (bvsle s t)))
(check-sat)
(exit)