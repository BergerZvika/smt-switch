(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvurem (_ bv1 k) (bvshl t s))) (_ bvk k)))
(check-sat)
