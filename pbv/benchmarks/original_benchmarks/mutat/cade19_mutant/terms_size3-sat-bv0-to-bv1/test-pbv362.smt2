(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvmul t (bvnot (int_to_pbv k 1)))) (bvshl s (bvneg t))))
(check-sat)
(exit)