(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvurem t (bvurem (_ bvk k) s))) (bvult s t)))
(check-sat)
