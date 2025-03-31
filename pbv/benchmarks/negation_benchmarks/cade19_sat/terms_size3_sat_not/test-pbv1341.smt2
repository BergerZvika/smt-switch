(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul (bvor s t) (bvshl s t)) (bvmul s (bvshl (bvor s t) t)))))
(check-sat)
(exit)