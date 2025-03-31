(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s t) (bvshl t s)) (bvmul s (bvlshr t (bvshl t s)))))
(check-sat)
(exit)