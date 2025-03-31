(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvmul t s) s) (bvule (bvmul s t) s)))
(check-sat)
(exit)