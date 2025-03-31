(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvmul t (bvnot (int_to_pbv k 0)))) (bvand s (bvneg t)))))
(check-sat)
(exit)