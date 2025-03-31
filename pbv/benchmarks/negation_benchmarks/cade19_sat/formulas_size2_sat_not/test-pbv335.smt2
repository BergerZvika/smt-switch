(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt (bvmul t s) (int_to_pbv k 0)) (bvslt (bvmul s t) (int_to_pbv k 0)))))
(check-sat)
(exit)