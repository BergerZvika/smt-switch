(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult (bvurem s (_ bv1 k)) t) (bvult s t)))
(check-sat)
