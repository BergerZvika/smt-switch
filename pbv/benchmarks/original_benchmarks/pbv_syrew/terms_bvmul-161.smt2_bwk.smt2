(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand t (bvmul s (bvand s (_ bv1 k)))) (bvand s (bvmul t (bvand s (_ bv1 k))))))
(check-sat)
