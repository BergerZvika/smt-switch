(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bvk k) (bvmul s (bvshl (_ bv1 k) t))) (distinct (_ bv0 k) (bvshl s t))))
(check-sat)
