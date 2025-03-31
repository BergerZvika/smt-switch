(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s t) (bvshl s t)) (bvand s (bvlshr t (bvshl s t)))))
(check-sat)
(exit)