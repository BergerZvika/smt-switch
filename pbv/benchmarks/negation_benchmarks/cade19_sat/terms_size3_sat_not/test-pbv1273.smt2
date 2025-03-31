(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvmul s t) (bvlshr s t)) (bvmul s (bvshl t (bvlshr s t))))))
(check-sat)
(exit)