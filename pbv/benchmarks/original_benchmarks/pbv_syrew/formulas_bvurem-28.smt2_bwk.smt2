(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bv0 k) (bvurem (_ bv1 k) s)) (distinct s (_ bv1 k))))
(check-sat)
