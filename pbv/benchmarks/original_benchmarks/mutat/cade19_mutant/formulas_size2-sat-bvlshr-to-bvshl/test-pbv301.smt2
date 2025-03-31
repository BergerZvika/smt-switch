(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvmul s (int_to_pbv k 0)) t) (bvslt (bvshl s s) t)))
(check-sat)
(exit)