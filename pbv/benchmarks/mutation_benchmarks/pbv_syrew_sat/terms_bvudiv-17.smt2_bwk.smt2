(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr (_ bv1 k) (bvnot s)) (bvudiv s (bvnot (_ bv0 k))))))
(check-sat)