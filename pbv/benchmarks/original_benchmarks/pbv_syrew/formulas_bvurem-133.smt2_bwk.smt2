(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl s (bvlshr (_ bv1 k) t))) (bvule (bvurem s t) t)))
(check-sat)
