(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult (int_to_pbv k 0) (bvshl s s)) (bvult s (bvshl s s)))))
(check-sat)
(exit)