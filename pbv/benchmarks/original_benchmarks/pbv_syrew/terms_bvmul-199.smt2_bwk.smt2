(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvmul t (bvand s t))) (bvand s (bvand t (_ bv1 k)))))
(check-sat)
