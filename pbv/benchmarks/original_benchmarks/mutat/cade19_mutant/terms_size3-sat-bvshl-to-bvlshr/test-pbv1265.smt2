(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s t) (bvadd s t)) (bvmul s (bvshl t (bvadd s t)))))
(check-sat)
(exit)