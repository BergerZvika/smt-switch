(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult (bvurem s t) s) (distinct s (bvurem s t)))))
(check-sat)
