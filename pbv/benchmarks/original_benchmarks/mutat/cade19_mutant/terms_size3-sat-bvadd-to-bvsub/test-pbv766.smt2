(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvor (bvsub t t) t)) (bvmul s (bvor t (bvadd t t)))))
(check-sat)
(exit)