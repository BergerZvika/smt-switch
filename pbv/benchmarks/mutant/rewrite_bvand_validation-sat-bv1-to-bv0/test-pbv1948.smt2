(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (_ bv0 k)) (bvand (_ bv1 k) (bvshl s t))) (bvshl s (bvshl (_ bv1 k) (bvand (_ bv1 k) (bvshl s t))))))
(check-sat)
(exit)