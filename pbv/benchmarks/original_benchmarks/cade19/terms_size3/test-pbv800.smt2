(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvshl (bvmul t t) t)) (bvadd s (bvmul t (bvshl t t)))))
(check-sat)
(exit)