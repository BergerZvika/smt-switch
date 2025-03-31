(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvmul (bvnot (int_to_pbv k 0)) t)) (bvadd s (bvneg t))))
(check-sat)
(exit)