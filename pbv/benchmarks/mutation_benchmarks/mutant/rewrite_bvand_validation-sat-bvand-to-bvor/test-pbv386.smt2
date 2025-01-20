(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (bvshl (bvor t (_ bv1 k)) (_ bv1 k))) t) (bvshl (bvshl s t) (bvshl (bvand t (_ bv1 k)) t))))
(check-sat)
(exit)