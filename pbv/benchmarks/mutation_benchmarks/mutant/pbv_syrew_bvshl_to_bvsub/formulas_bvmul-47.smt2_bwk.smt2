(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvmul s (bvsub (_ bv1 k) t))) (= s (bvshl s t))))
(check-sat)
