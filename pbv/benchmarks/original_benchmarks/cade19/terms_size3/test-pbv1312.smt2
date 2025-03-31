(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand s t) (bvshl t t)) (bvand s (bvlshr t (bvshl t t)))))
(check-sat)
(exit)