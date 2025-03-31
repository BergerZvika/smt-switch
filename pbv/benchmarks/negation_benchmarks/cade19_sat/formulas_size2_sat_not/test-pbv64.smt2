(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult s (bvmul s (int_to_pbv k 0))) false)))
(check-sat)
(exit)