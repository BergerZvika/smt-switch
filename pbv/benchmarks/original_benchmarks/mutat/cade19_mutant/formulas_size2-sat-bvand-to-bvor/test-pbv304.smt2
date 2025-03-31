(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvor s (int_to_pbv k 0)) t) true))
(check-sat)
(exit)