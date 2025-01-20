(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvshl s s) (bvand s (_ bv0 k))) t) (bvshl (bvshl (bvshl s s) t) (bvand s (_ bv1 k)))))
(check-sat)
(exit)