(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (_ bv0 k) (bvshl (bvand t (_ bv1 k)) s))) (bvand s (bvshl (_ bv1 k) (bvshl (bvand s t) s)))))
(check-sat)
(exit)