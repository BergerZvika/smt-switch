(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvmul s t) (bvmul s t)) (bvmul s (bvadd t t))))
(check-sat)
(exit)