(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvshl s (bvurem (_ bv1 k) (bvlshr t t))) (bvshl s (_ bv1 k)))))
(check-sat)
