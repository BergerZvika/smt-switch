(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s (bvadd s t)) t) (bvmul s (bvshl (bvadd s t) t))))
(check-sat)
(exit)