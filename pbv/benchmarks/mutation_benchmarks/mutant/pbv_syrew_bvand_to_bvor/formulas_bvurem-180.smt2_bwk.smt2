(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvor t (bvurem t s))) (bvult s (bvurem t s))))
(check-sat)
