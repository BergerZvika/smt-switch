(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvshl s (bvlshr t (_ bv1 k)))) (bvult (bvudiv s s) t)))
(check-sat)