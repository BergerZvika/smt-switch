(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul s t) (bvand s t)) (bvmul s (bvshl t (bvand s t)))))
(check-sat)
(exit)