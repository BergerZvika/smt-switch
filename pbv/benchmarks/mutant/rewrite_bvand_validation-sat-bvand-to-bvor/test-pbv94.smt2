(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvshl (_ bv1 k) t) (bvshl (bvand s t) s)) (bvand (bvshl s s) (bvshl (_ bv1 k) t))))
(check-sat)
(exit)