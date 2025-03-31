(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvneg s) (bvmul s s)) (bvmul s (bvneg (bvneg s)))))
(check-sat)
(exit)