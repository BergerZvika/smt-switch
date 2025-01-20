(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (bvudiv s s) s) (bvudiv (_ bv0 k) s)))
(check-sat)
