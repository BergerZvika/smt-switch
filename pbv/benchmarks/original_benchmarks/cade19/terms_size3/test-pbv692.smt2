(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvand (bvlshr t s) t)) (bvand s (bvand t (bvlshr t s)))))
(check-sat)
(exit)