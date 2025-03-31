(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul t (bvmul s (bvmul s s))) (bvmul s (bvmul s (bvmul s t))))))
(check-sat)
(exit)