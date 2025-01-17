(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor (bvshl s (_ bv1 k)) (bvshl (_ bv1 k) t)) s) (bvshl (bvshl (bvand s t) s) t)))
(check-sat)
(exit)