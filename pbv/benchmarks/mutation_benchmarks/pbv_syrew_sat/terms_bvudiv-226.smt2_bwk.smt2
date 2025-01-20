(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvudiv (_ bv1 k) (bvnot s))) (bvudiv (_ bv0 k) (bvnot s)))))
(check-sat)
