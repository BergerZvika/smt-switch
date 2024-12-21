(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvand s t) (_ bv1 k)) t) (bvlshr (bvadd t (bvand s t)) t)))
(check-sat)
(exit)