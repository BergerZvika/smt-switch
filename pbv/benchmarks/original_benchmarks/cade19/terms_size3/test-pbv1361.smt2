(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvshl s t) (bvlshr t s)) (bvmul s (bvshl (bvlshr t s) t))))
(check-sat)
(exit)