(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s (bvshl s t)) t) (bvmul s (bvshl (bvshl s t) t))))
(check-sat)
(exit)