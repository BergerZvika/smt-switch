(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvsub (bvlshr s t) t) t) (bvlshr t (bvand s (bvshl t t)))))
(check-sat)
(exit)