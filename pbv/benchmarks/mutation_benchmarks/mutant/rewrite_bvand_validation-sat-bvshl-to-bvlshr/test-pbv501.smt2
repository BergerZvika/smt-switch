(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvand s (_ bv1 k)) (bvshl s t)) t) (bvshl (bvshl (bvand s (_ bv1 k)) t) (bvshl s t))))
(check-sat)
(exit)