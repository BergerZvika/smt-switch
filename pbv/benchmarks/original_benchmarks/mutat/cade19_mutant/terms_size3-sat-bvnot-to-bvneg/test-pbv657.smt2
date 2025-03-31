(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvneg (int_to_pbv k 0)) t)) (bvneg (bvshl s t))))
(check-sat)
(exit)