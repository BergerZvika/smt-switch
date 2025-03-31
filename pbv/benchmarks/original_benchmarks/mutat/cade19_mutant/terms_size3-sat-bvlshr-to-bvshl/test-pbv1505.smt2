(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor t (bvnot (int_to_pbv k 0))) t) (bvshl (bvnot (bvshl s s)) t)))
(check-sat)
(exit)