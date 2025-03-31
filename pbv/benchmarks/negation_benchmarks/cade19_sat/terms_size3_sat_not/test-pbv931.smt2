(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvmul (bvmul t (int_to_pbv k 0)) t)) (int_to_pbv k 0))))
(check-sat)
(exit)