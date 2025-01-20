(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvmul s (bvnot t))) (bvand s (bvand (_ bv1 k) (bvnot t)))))
(check-sat)