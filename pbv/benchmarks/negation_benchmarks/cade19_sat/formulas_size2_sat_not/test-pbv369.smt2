(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt (bvor (int_to_pbv k 0) s) t) (bvslt s t))))
(check-sat)
(exit)