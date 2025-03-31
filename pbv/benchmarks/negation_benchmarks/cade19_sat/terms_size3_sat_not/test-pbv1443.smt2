(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvmul s t)) t) (bvshl (bvshl s t) (bvmul s t)))))
(check-sat)
(exit)