(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvmul t s)) (bvule s (bvmul s t))))
(check-sat)
(exit)