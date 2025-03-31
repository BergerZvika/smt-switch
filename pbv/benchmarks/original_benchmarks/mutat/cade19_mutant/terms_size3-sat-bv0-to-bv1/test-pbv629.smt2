(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvadd (bvnot (int_to_pbv k 1)) t)) (bvand s (bvnot (bvneg t)))))
(check-sat)
(exit)