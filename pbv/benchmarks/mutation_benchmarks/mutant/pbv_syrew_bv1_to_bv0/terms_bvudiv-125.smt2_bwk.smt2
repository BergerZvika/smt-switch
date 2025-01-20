(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvlshr t (bvudiv s s))) (bvlshr s (bvlshr t (_ bv0 k)))))
(check-sat)
