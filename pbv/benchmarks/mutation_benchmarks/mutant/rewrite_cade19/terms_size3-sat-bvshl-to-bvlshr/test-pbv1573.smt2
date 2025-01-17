(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvand (bvlshr t s) t) s) (bvand (bvlshr (bvor s t) s) t)))
(check-sat)
(exit)