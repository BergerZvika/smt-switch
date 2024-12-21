(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvand (bvshl s t) (bvshl (bvand s (_ bv1 k)) s)) (bvand (bvshl t t) (bvshl (_ bv1 k) s)))))
(check-sat)
(exit)