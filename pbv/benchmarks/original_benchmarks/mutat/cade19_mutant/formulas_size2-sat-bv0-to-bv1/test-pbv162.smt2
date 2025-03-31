(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvmul (int_to_pbv k 1) t)) (= s (int_to_pbv k 0))))
(check-sat)
(exit)