(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (bvmul s s) (bvmul s s)) (bvmul s (bvadd s s)))))
(check-sat)
(exit)