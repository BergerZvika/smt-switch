(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvmul (bvneg (int_to_pbv k 0)) t)) (bvneg (bvmul s t))))
(check-sat)
(exit)