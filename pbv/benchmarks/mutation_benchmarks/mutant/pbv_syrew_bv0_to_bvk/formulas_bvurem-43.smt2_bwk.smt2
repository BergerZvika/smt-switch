(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult (bvurem s (_ bvk k)) t) (bvult s t)))
(check-sat)
