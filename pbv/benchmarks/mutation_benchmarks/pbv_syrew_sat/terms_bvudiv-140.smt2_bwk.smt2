(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvudiv s (bvlshr t (bvlshr t t))) (bvudiv s t))))
(check-sat)
