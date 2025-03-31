(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle (bvmul t s) s) (bvsle (bvmul s t) s)))
(check-sat)
(exit)