(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvult (_ bv1 k) (bvurem (_ bv1 k) t)) (distinct s s))))
(check-sat)
