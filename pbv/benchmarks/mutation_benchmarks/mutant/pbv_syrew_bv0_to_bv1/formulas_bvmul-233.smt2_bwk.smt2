(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv1 k) (bvmul s (bvlshr t t))) (= s s)))
(check-sat)
