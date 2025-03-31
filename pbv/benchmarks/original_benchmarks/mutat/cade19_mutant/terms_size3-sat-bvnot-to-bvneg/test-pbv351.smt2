(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvadd t (bvneg (int_to_pbv k 0)))) (bvnot (bvneg (bvadd s t)))))
(check-sat)
(exit)