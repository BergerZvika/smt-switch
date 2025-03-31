(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvneg (int_to_pbv k 0)) s) true))
(check-sat)
(exit)