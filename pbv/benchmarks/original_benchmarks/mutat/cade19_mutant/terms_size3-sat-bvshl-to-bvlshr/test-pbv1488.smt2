(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl s (bvmul t t)) t) (bvshl (bvshl s t) t)))
(check-sat)
(exit)