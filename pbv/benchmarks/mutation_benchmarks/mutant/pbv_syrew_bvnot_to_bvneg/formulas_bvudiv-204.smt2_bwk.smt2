(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvudiv t (bvlshr t t))) (distinct s (bvneg (_ bv0 k)))))
(check-sat)
