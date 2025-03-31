(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand t (bvor (bvmul t (int_to_pbv k 0)) s)) (bvand s t))))
(check-sat)
(exit)