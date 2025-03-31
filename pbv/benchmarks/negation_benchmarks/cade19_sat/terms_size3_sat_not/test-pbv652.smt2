(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvor (bvnot (int_to_pbv k 0)) t)) (bvneg s))))
(check-sat)
(exit)