(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= (bvmul t s) t) (= (bvmul s t) t)))
(check-sat)
(exit)