(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvlshr t (bvurem t (_ bv0 k)))) (distinct s s)))
(check-sat)