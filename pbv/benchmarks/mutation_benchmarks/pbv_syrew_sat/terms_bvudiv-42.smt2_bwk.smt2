(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvnot (bvudiv (_ bv0 k) (bvlshr s (_ bv1 k)))) (bvudiv (_ bv0 k) (bvudiv (_ bv1 k) s)))))
(check-sat)
