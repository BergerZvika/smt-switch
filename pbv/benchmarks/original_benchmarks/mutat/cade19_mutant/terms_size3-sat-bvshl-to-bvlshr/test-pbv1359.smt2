(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvlshr s t) (bvshl s t)) (bvmul s (bvshl (bvshl s t) t))))
(check-sat)
(exit)