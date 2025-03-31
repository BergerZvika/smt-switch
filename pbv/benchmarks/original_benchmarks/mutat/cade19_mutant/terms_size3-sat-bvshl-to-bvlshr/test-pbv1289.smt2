(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s t) (bvshl t t)) (bvmul s (bvshl t (bvshl t t)))))
(check-sat)
(exit)