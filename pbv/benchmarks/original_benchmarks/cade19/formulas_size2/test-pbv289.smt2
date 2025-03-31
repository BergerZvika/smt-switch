(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvadd s (int_to_pbv k 0)) s) false))
(check-sat)
(exit)