(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult s (bvudiv t (bvlshr t t))) (distinct s (bvnot (_ bv0 k))))))
(check-sat)
