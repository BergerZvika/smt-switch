(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult (bvlshr s (_ bv1 k)) t) (bvule (bvudiv s t) (_ bv1 k))))
(check-sat)
