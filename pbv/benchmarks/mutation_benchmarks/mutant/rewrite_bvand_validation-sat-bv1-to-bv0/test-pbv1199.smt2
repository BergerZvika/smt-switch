(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl (bvshl (bvshl (_ bv0 k) t) t) (_ bv1 k))) (bvand s (bvshl (bvshl (_ bv1 k) t) (bvshl (_ bv1 k) t)))))
(check-sat)
(exit)