(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr (_ bv1 k) (bvsub s t))) (bvshl s (bvlshr t (bvshl s t)))))
(check-sat)
