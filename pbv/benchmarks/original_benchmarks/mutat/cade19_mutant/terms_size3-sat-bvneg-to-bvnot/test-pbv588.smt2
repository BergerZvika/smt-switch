(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvor (bvnot t) t)) (bvmul s (bvor t (bvneg t)))))
(check-sat)
(exit)