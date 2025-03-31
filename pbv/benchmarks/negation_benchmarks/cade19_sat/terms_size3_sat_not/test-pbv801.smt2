(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvshl (bvmul t t) t)) (bvmul s (bvmul t (bvshl t t))))))
(check-sat)
(exit)