(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvurem s (bvurem (_ bv1 k) (bvlshr t t))) (_ bv0 k))))
(check-sat)
