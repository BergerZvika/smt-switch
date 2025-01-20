(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvor s t) (_ bv1 k)) s) (bvlshr (bvadd s (bvand s t)) s)))
(check-sat)
(exit)