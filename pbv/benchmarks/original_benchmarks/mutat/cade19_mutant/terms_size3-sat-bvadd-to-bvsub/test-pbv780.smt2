(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvsub (bvmul t t) t)) (bvor s (bvadd t (bvmul t t)))))
(check-sat)
(exit)