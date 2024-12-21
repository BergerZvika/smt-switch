(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (_ bv0 k) (bvand t (bvshl (_ bv1 k) t)))) (bvshl s (_ bv1 k))))
(check-sat)
(exit)