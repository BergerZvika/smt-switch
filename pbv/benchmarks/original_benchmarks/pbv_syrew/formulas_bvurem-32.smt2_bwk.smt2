(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult (_ bv1 k) (bvurem (_ bv0 k) s)) (distinct s s)))
(check-sat)
