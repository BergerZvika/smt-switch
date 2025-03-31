(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvnot s) s)) (bvmul s (bvlshr (bvneg s) s))))
(check-sat)
(exit)