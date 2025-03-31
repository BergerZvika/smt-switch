(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvand t (bvnot (int_to_pbv k 1)))) (bvshl s t)))
(check-sat)
(exit)