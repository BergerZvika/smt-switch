(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (bvlshr s t) t)) (bvshl (bvlshr s t) t)))
(check-sat)
(exit)