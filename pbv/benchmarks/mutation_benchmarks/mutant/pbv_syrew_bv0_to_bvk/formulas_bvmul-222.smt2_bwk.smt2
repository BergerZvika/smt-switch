(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bvk k) (bvmul s (bvshl s t))) (bvult t (bvmul s (bvshl s t)))))
(check-sat)
