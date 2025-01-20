(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvand (_ bv0 k) (bvlshr t t))) (bvnot (_ bv0 k))))
(check-sat)
