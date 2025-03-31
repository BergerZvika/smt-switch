(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvor s (int_to_pbv k 0))) true))
(check-sat)
(exit)