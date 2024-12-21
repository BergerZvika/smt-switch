(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvshl (bvshl (_ bv1 k) t) t)) s) (bvshl (bvand (_ bv1 k) (bvshl s t)) s)))
(check-sat)
(exit)