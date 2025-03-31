(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvneg s) (bvmul s t)) (bvmul s (bvmul t (bvnot s)))))
(check-sat)
(exit)