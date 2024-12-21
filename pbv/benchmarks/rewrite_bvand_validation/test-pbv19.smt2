(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s (_ bv1 k)) (bvshl (bvshl s t) t)) (bvand (bvshl s t) (bvshl s (bvshl (_ bv1 k) t)))))
(check-sat)
(exit)