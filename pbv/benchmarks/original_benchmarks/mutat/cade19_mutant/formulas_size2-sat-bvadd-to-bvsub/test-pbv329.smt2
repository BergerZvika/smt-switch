(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvsub t s) (int_to_pbv k 0)) (bvsle (bvadd s t) (int_to_pbv k 0))))
(check-sat)
(exit)