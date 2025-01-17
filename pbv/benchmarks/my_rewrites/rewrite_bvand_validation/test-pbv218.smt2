(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvshl s s) s) (bvand t (_ bv1 k))) (bvshl (bvshl s s) (bvshl s (bvand s t)))))
(check-sat)
(exit)