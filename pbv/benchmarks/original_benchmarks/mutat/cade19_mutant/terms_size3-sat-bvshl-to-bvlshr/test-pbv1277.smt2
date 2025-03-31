(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvmul s t) (bvlshr s t)) (bvmul s (bvmul s (bvshl t t)))))
(check-sat)
(exit)