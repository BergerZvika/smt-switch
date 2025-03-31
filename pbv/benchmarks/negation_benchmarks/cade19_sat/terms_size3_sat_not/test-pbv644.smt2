(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvand (bvnot (int_to_pbv k 0)) t)) (bvshl s t))))
(check-sat)
(exit)