(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvand s t) (_ bv0 k)) (_ bv1 k)) (bvand s (bvlshr (bvadd t t) (_ bv1 k)))))
(check-sat)
(exit)