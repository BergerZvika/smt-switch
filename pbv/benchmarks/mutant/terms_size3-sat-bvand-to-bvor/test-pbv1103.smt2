(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvadd (bvlshr t t) s)) (bvand s t)))
(check-sat)
(exit)