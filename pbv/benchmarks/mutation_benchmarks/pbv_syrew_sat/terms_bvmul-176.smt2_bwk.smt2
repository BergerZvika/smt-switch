(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand (_ bv1 k) (bvnot (bvmul s t))) (bvand (_ bv1 k) (bvnot (bvand s t))))))
(check-sat)