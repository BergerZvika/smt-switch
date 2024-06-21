(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvand t (bvshl (bvand t (_ bv1 k)) (_ bv1 k)))) (bvand s (bvand t (bvshl (_ bv1 k) (bvand t (_ bv1 k))))))))
(check-sat)
(exit)