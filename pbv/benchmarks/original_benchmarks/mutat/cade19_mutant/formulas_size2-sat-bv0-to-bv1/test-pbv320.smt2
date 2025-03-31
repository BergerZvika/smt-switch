(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvshl s (int_to_pbv k 1)) s) false))
(check-sat)
(exit)