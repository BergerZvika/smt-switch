(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvmul t (bvlshr t t))) (= s (_ bvk k))))
(check-sat)