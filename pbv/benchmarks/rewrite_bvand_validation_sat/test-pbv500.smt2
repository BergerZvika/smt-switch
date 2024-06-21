(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl (bvand s (_ bv1 k)) (bvand s t)) t) (bvshl (bvshl (bvand s (_ bv1 k)) t) (bvand s t)))))
(check-sat)
(exit)