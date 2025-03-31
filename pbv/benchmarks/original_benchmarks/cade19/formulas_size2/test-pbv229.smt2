(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvnot s) (int_to_pbv k 0)) (bvsle (int_to_pbv k 0) s)))
(check-sat)
(exit)