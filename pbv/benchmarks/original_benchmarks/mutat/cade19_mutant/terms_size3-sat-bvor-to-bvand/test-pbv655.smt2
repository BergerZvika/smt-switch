(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvor (bvnot (int_to_pbv k 0)) t)) (bvnot (int_to_pbv k 0))))
(check-sat)
(exit)