(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl (_ bv1 k) (_ bv1 k)) (bvshl (bvshl s s) t)) (bvand (bvshl s s) (bvshl (_ bv1 k) (bvshl (_ bv1 k) t)))))
(check-sat)
(exit)