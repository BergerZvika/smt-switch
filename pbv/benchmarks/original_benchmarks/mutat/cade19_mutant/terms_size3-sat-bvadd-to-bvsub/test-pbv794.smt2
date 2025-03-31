(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvor (bvmul t t) t)) (bvadd s (bvor t (bvmul t t)))))
(check-sat)
(exit)