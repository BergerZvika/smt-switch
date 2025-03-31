(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvand (bvnot (int_to_pbv k 0)) t)) (bvand s t))))
(check-sat)
(exit)