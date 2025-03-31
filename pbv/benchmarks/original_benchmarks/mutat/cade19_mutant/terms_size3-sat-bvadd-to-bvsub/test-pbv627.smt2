(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvadd (bvnot (int_to_pbv k 0)) t)) (bvnot (bvneg (bvadd s t)))))
(check-sat)
(exit)