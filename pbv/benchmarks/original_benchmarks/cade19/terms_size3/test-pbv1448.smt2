(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvlshr s t)) t) (bvand s (bvshl s t))))
(check-sat)
(exit)