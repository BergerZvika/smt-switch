(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvor t (bvnot (int_to_pbv k 0)))) (bvnot (bvneg s)))))
(check-sat)
(exit)