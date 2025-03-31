(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvlshr (bvshl (bvand s t) t) t) (bvand s (bvlshr (bvshl t t) t)))))
(check-sat)
(exit)