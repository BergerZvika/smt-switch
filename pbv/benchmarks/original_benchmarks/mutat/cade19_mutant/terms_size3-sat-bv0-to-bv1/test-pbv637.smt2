(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvmul (bvnot (int_to_pbv k 1)) t)) (bvor s (bvneg t))))
(check-sat)
(exit)