(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvurem (_ bvk k) s)) (distinct s (_ bv0 k))))
(check-sat)
