(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvand t (bvlshr (bvshl (_ bv1 k) s) s))) (_ bv0 k)))
(check-sat)
(exit)