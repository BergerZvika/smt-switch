(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvshl (int_to_pbv k 1) s) s) (bvult (int_to_pbv k 0) s)))
(check-sat)
(exit)