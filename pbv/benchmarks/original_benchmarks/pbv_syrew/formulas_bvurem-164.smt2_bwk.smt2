(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvshl t (bvurem s (_ bv0 k)))) (distinct s (bvshl t s))))
(check-sat)
