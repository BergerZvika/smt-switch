(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl s (bvurem s t))) (= (_ bv1 k) (bvurem s t))))
(check-sat)
