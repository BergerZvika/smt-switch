(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle s (bvnot (int_to_pbv k 1))) (bvslt s (int_to_pbv k 0))))
(check-sat)
(exit)