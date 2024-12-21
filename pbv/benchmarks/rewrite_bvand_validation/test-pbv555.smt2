(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvand s (bvshl (_ bv1 k) t)) t) (_ bv1 k)) (bvshl (bvand s (bvshl (_ bv1 k) t)) (bvshl (_ bv1 k) t))))
(check-sat)
(exit)