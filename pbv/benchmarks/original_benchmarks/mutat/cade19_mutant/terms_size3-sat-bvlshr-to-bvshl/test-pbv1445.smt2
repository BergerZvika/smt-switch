(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr s (bvand s t)) t) (bvlshr (bvlshr s t) (bvand s t))))
(check-sat)
(exit)