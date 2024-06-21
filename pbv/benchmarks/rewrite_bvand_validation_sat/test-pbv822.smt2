(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand s (bvshl (bvand s (_ bv1 k)) (_ bv1 k))) (bvand s (bvshl (_ bv1 k) (bvand s (_ bv1 k)))))))
(check-sat)
(exit)