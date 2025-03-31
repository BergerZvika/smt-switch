(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvshl s (int_to_pbv k 0)) t) (bvult s t)))
(check-sat)
(exit)