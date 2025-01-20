(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvlshr t (bvudiv t t))) (bvule s (bvlshr t (_ bv1 k)))))
(check-sat)
