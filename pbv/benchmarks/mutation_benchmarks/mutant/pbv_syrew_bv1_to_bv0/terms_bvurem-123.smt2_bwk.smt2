(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr t (bvshl (_ bv0 k) s))) (bvurem s (bvlshr t (bvshl s s)))))
(check-sat)
