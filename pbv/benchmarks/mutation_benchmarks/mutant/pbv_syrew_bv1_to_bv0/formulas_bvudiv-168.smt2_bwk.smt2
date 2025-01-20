(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvlshr t (bvudiv s s))) (bvule s (bvlshr t (_ bv0 k)))))
(check-sat)