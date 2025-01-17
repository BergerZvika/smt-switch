(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvand s t) (bvlshr t s)) (bvand s (bvand t (bvlshr t s)))))
(check-sat)
(exit)