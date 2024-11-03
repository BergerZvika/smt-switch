(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor t (bvshl s (bvand t (_ bv1 k)))) t) (bvshl (bvand s (bvand t (bvnot (_ bv1 k)))) t)))
(check-sat)
(exit)