(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvlshr t (bvurem (_ bvk k) s))) (= s t)))
(check-sat)
