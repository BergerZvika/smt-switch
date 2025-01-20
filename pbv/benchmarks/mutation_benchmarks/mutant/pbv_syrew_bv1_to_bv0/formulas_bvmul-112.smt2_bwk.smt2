(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvand (_ bv0 k) (bvmul s t))) (distinct s (bvand s (bvand t (_ bv1 k))))))
(check-sat)
