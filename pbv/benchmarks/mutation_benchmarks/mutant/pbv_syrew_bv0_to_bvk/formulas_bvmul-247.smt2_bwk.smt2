(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bvk k) (bvshl (_ bv1 k) (bvmul s s))) (bvule (bvmul s s) (_ bv1 k))))
(check-sat)
