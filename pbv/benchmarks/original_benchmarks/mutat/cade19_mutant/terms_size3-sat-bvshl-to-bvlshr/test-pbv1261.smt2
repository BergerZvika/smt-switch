(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s t) (bvadd s s)) (bvmul s (bvshl t (bvadd s s)))))
(check-sat)
(exit)