(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvudiv (_ bv1 k) s)) (bvule s (_ bv1 k)))))
(check-sat)
