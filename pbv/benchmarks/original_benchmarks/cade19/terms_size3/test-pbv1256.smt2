(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul s t) (bvneg s)) (bvmul s (bvshl t (bvneg s)))))
(check-sat)
(exit)