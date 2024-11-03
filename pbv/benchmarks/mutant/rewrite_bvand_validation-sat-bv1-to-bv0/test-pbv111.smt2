(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl (_ bv0 k) (_ bv1 k)) (bvshl (bvshl s t) t)) (bvand s (bvshl (bvand (_ bv1 k) (bvshl (_ bv1 k) t)) (_ bv1 k)))))
(check-sat)
(exit)