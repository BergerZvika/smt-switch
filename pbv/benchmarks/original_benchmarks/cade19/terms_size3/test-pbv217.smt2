(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvnot (bvmul s s))) (int_to_pbv k 0)))
(assert (> k 4))
(check-sat)
(exit)