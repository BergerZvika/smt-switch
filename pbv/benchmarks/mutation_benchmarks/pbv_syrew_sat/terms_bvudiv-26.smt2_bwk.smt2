(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvudiv (_ bv1 k) (bvudiv (_ bv1 k) s)) (bvudiv s (bvudiv (_ bv1 k) s)))))
(check-sat)
