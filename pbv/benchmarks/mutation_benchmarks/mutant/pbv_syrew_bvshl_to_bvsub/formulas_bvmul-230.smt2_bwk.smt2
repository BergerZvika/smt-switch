(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvmul s (bvlshr t s))) (= s (bvsub s (bvlshr t s)))))
(check-sat)