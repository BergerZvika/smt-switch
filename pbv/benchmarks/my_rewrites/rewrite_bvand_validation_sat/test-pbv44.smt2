(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (bvshl t (_ bv1 k)) (bvshl (bvand s t) t)) (bvand (bvshl s t) (bvshl t (bvand t (_ bv1 k)))))))
(check-sat)
(exit)