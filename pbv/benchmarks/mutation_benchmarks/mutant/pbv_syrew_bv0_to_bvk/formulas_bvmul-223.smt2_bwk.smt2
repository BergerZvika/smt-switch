(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bvk k) (bvmul s (bvand s (_ bv1 k)))) (distinct (_ bv0 k) (bvand s (_ bv1 k)))))
(check-sat)
