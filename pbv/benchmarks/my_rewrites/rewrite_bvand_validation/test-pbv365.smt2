(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s (bvshl (bvand s t) (_ bv1 k))) t) (bvshl (bvshl s t) (bvshl (bvand s t) t))))
(check-sat)
(exit)