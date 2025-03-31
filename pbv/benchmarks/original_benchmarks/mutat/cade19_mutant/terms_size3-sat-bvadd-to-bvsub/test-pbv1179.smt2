(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvneg s) (bvmul s s)) (bvmul s (bvnot (bvneg s)))))
(check-sat)
(exit)