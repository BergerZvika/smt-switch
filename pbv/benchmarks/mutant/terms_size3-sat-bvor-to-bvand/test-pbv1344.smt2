(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvor s t) (bvlshr t s)) (bvor s (bvor t (bvlshr t s)))))
(check-sat)
(exit)