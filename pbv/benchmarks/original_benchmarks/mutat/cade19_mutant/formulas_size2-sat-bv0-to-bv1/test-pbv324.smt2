(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvshl s (int_to_pbv k 1)) t) (bvslt s t)))
(check-sat)
(exit)