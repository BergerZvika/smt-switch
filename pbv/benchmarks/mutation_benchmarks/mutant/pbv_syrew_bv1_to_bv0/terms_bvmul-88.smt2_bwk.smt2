(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvand (_ bv0 k) (bvlshr t t))) (_ bv0 k)))
(check-sat)
