(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl (bvshl (_ bv1 k) s) (_ bv1 k)) (bvand s t)) (bvshl (bvshl (_ bv1 k) s) (bvshl (_ bv1 k) (bvand s t))))))
(check-sat)
(exit)