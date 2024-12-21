(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvshl (_ bv1 k) s) s) (bvand s t)) (bvshl (bvshl (_ bv1 k) s) (bvshl s (bvand s t)))))
(check-sat)
(exit)