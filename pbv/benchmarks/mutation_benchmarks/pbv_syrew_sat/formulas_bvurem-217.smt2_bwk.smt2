(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvlshr t (bvurem (_ bv0 k) s))) (bvult s t))))
(check-sat)
