(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (bvand s t) (bvshl s (_ bv1 k)))) (bvand s (bvand t (bvshl s (bvshl s (_ bv1 k)))))))
(check-sat)
(exit)