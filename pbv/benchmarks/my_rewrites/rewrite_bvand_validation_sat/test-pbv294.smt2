(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvshl s (bvand t (_ bv1 k)))) t) (bvshl (bvshl s t) (bvshl s (bvand s t))))))
(check-sat)
(exit)