(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvor (_ bv1 k) (bvmul t t))) (bvmul s (bvand t (_ bv1 k)))))
(check-sat)
