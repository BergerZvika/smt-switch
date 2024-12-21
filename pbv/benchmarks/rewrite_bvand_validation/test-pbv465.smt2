(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand (bvshl s s) (bvshl (_ bv1 k) t)) t) (bvshl (bvshl (bvand s t) s) t)))
(check-sat)
(exit)