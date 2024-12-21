(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvshl (bvshl s t) t)) (bvand s (bvlshr (bvshl (_ bv1 k) t) t))))
(check-sat)
(exit)