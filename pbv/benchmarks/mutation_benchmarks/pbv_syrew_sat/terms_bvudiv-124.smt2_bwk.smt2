(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvshl s (bvlshr t (bvudiv s s))) (bvshl s (bvlshr t (_ bv1 k))))))
(check-sat)
