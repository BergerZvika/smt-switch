(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvurem (_ bv0 k) t)) (distinct s (_ bv0 k)))))
(check-sat)
