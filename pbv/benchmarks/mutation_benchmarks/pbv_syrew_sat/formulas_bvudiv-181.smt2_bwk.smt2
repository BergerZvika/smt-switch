(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvlshr t (bvudiv s t))) (= s (bvshl t s)))))
(check-sat)
