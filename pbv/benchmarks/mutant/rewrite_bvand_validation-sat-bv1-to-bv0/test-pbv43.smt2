(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl t (_ bv0 k)) (bvshl (_ bv1 k) (bvand s (_ bv1 k)))) (bvshl (bvand s (bvand t (_ bv1 k))) (_ bv1 k))))
(check-sat)
(exit)