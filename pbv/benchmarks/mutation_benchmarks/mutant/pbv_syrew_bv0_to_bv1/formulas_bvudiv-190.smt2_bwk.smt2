(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvudiv t (bvlshr t s))) (distinct s (bvnot (_ bv1 k)))))
(check-sat)
