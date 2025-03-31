(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvlshr (bvnot (int_to_pbv k 0)) t)) (bvmul s (bvlshr (bvnot t) t)))))
(check-sat)
(exit)