(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvlshr t (bvurem (_ bv1 k) s))) (bvult s t)))
(check-sat)