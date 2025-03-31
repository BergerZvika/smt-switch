(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvsub (bvmul t (int_to_pbv k 0)) s)) (bvshl s s)))
(check-sat)
(exit)