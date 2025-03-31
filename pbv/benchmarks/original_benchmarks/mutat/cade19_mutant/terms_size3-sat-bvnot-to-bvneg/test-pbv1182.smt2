(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvneg s) (bvmul s t)) (bvmul s (bvneg (bvneg t)))))
(check-sat)
(exit)