(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvsub (int_to_pbv k 0) s) t) (bvsle s t)))
(check-sat)
(exit)