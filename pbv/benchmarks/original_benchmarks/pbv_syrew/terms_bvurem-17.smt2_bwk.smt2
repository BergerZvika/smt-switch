(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem (_ bv1 k) (bvshl s s)) (_ bv1 k)))
(check-sat)
