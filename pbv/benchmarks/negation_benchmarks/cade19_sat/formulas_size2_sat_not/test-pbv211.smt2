(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt (int_to_pbv k 0) (bvmul t s)) (bvslt (int_to_pbv k 0) (bvmul s t)))))
(check-sat)
(exit)