(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvlshr t (bvurem s (_ bv0 k)))) (distinct s (bvlshr t s))))
(check-sat)