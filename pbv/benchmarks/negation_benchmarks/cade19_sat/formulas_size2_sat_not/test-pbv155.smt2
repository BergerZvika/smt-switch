(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt s (bvshl (int_to_pbv k 0) s)) (bvslt s (int_to_pbv k 0)))))
(check-sat)
(exit)