(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul s t) (bvadd t t)) (bvmul s (bvshl t (bvadd t t)))))
(check-sat)
(exit)