(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvor s t) t) t) (bvand s (bvlshr (bvshl t t) t))))
(check-sat)
(exit)