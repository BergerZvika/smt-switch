(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvadd s t) (bvmul s t)) (bvadd s (bvadd t (bvmul s t)))))
(check-sat)
(exit)