(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul (bvadd s s) (bvshl s t)) (bvmul s (bvshl (bvadd s s) t)))))
(check-sat)
(exit)