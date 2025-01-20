(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvshl (_ bv0 k) t) (bvand s t)) s) (bvshl (bvshl (bvshl (_ bv1 k) s) t) (bvand s t))))
(check-sat)
(exit)