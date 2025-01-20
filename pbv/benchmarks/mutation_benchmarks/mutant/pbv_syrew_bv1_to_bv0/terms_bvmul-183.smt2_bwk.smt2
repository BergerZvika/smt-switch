(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvmul s (bvand s t))) (bvand s (bvand t (_ bv1 k)))))
(check-sat)
