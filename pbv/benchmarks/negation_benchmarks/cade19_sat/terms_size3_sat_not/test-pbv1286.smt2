(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (bvmul s t) (bvmul t t)) (bvmul (bvadd s t) t))))
(check-sat)
(exit)