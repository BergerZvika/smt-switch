(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvudiv s (bvudiv (_ bv1 k) s))) (_ bv0 k)))
(check-sat)
