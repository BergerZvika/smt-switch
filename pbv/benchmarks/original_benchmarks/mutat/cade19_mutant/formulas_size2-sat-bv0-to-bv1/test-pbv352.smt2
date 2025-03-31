(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvmul (int_to_pbv k 1) s) t) true))
(check-sat)
(exit)