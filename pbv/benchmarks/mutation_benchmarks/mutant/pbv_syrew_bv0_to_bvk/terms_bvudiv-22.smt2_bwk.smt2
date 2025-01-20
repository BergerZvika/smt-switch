(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl (_ bv1 k) (bvudiv (_ bvk k) s)) (bvudiv (_ bv1 k) (bvudiv s s))))
(check-sat)
