(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvshl t t) t)) (bvmul s (bvshl (bvsub t t) t))))
(check-sat)
(exit)