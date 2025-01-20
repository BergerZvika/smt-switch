(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul t (bvshl s (bvor s (_ bv1 k)))) (bvmul s (bvshl t (bvand s (_ bv1 k))))))
(check-sat)
