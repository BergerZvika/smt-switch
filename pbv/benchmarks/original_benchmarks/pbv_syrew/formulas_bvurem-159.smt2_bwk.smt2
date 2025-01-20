(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvurem t (bvurem s t))) (bvult s (bvurem t s))))
(check-sat)