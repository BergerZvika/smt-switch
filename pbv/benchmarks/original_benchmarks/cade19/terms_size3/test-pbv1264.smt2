(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul s t) (bvshl s s)) (bvmul s (bvshl t (bvshl s s)))))
(check-sat)
(exit)