(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvnot (bvand s (_ bv1 k)))) (bvudiv s (bvnot (_ bv1 k)))))
(check-sat)
