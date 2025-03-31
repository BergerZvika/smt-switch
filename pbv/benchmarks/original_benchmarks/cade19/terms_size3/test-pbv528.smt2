(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvadd t (bvand t (int_to_pbv k 0)))) (bvshl s t)))
(check-sat)
(exit)