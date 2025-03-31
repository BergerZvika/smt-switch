(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt s (bvmul t s)) (bvslt s (bvmul s t)))))
(check-sat)
(exit)