(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub (_ bv1 k) (bvudiv (_ bv0 k) s)) (bvudiv (_ bv1 k) (bvudiv s s))))
(check-sat)
