(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvmul s (bvlshr t t))) (= s (_ bv0 k))))
(check-sat)
