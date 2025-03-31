(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvadd s (bvmul s s))) (bvmul s (bvadd t (bvmul s t)))))
(check-sat)
(exit)