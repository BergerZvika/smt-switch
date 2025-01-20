(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvudiv s (bvlshr (_ bv1 k) (bvlshr s (_ bv1 k)))) (bvudiv s (bvudiv (_ bv1 k) s)))))
(check-sat)
