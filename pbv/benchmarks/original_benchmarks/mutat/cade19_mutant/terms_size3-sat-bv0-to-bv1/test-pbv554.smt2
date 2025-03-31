(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvshl t (bvand t (int_to_pbv k 1)))) (bvmul s t)))
(check-sat)
(exit)