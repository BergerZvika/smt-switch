(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvmul s (bvor s t))) (bvmul s (bvmul t (bvor s t)))))
(check-sat)
(exit)