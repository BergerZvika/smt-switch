(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvlshr t (bvurem s (_ bvk k)))) (bvult s (bvlshr t s))))
(check-sat)
