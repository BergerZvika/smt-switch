(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvurem (_ bv0 k) (bvshl s s))) (_ bv0 k)))
(check-sat)