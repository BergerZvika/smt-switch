(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvlshr s (bvudiv t (bvudiv (_ bv0 k) s))) (_ bv0 k))))
(check-sat)
