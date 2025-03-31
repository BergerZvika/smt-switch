(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor (bvmul s s) (bvor s t)) (bvor s (bvor t (bvmul s s))))))
(check-sat)
(exit)