(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvshl (bvand s t) (bvshl t (_ bv1 k)))) (bvand s (bvand t (bvshl t (bvshl t (_ bv1 k)))))))
(check-sat)
(exit)