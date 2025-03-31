(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s t) (bvneg s)) (bvmul s (bvshl t (bvneg s)))))
(check-sat)
(exit)