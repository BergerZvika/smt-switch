(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul s (bvshl s t)) t) (bvmul s (bvshl (bvlshr s t) t))))
(check-sat)
(exit)