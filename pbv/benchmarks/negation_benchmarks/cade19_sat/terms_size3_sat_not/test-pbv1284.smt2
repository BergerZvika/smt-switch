(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvmul s t) (bvshl t s)) (bvmul s (bvshl t (bvshl t s))))))
(check-sat)
(exit)