(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvor (bvmul t (int_to_pbv k 1)) s)) s))
(check-sat)
(exit)