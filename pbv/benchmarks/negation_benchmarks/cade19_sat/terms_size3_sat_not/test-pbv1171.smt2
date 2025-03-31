(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul t (bvor (bvand t (int_to_pbv k 0)) s)) (bvmul s t))))
(check-sat)
(exit)