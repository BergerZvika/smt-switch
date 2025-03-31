(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr s (bvmul (bvnot (int_to_pbv k 0)) t)) (bvlshr s (bvneg t)))))
(check-sat)
(exit)