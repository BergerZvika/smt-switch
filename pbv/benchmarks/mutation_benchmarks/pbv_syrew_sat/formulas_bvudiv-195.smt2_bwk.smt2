(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvlshr t (bvudiv t s))) (= s (_ bv0 k)))))
(check-sat)
