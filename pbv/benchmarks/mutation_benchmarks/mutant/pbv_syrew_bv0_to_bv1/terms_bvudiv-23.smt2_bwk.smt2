(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv (_ bv1 k) (bvudiv (_ bv1 k) s)) (bvnot (bvudiv (_ bv0 k) s))))
(check-sat)
