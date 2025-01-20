(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvudiv s (bvlshr t (bvudiv t t))) (bvudiv s (bvlshr t (_ bv1 k)))))
(check-sat)
