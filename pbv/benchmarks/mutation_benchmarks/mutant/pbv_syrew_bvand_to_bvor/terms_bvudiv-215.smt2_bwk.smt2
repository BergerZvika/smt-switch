(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor s (bvudiv (_ bv0 k) (bvlshr t t))) s))
(check-sat)
