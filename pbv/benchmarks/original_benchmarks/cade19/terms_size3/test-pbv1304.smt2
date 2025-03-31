(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvand s t) (bvlshr t s)) (bvand s (bvand t (bvlshr t s)))))
(check-sat)
(exit)