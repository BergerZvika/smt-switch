(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvmul s (bvand t (_ bv1 k)))) (bvmul s (bvand t (_ bv1 k))))))
(check-sat)