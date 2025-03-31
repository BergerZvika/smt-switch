(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvmul (int_to_pbv k 0) t)) false))
(check-sat)
(exit)