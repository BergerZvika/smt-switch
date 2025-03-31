(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvneg (bvmul (bvnot (int_to_pbv k 0)) t)) (bvadd (bvshl s s) t)))
(check-sat)
(exit)