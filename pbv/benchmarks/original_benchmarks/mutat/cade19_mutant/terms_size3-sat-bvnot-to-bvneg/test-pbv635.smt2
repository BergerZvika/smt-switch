(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvmul (bvneg (int_to_pbv k 0)) t)) (bvand s (bvneg t))))
(check-sat)
(exit)