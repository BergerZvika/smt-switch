(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (bvand (_ bv0 k) (bvshl (_ bv1 k) t))) t) (bvshl (bvshl s t) (bvand (_ bv1 k) (bvshl (_ bv1 k) t)))))
(check-sat)
(exit)