(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvmul s t) (bvmul t t)) (bvmul s (bvshl t (bvmul t t))))))
(check-sat)
(exit)