(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvlshr (bvnot s) s)) (bvmul s (bvlshr (bvnot s) s))))
(check-sat)
(exit)