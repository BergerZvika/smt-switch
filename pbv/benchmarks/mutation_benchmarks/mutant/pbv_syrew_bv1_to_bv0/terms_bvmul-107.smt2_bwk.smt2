(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvand s (_ bv0 k)) (_ bv1 k))) (bvmul s (bvmul s (bvshl s (_ bv1 k))))))
(check-sat)
