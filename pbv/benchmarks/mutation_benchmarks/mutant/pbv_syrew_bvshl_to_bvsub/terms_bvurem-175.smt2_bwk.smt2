(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr (_ bv1 k) (bvlshr t s))) (bvurem s (bvsub s (bvlshr t s)))))
(check-sat)
