(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl (_ bv1 k) (_ bv1 k)) (bvshl (bvshl s (_ bv1 k)) t)) (bvshl (bvand (_ bv1 k) (bvshl s t)) (_ bv1 k))))
(check-sat)
(exit)