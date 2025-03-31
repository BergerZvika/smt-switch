(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvnot (int_to_pbv k 0))) (bvneg s))))
(check-sat)
(exit)