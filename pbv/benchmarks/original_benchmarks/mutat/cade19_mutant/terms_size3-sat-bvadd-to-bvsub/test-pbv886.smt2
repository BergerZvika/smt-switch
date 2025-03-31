(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvor (bvshl t t) t)) (bvmul s (bvsub t (bvshl t t)))))
(check-sat)
(exit)