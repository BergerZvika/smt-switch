(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (int_to_pbv k 0) (bvmul t s)) (bvult (int_to_pbv k 0) (bvmul s t))))
(check-sat)
(exit)