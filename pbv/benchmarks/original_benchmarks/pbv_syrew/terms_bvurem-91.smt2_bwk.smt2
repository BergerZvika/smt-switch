(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr t (bvshl t s))) (bvurem s (bvshl t (bvshl t s)))))
(check-sat)