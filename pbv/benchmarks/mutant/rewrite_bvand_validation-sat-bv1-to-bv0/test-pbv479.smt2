(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvand s t) (bvand t (_ bv0 k))) s) (bvshl (bvshl (bvand s t) s) (bvand t (_ bv1 k)))))
(check-sat)
(exit)