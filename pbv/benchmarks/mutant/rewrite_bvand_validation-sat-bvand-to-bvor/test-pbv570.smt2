(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvshl (bvor s t) t) t) s) (bvshl (bvshl (bvshl (bvand s t) s) s) t)))
(check-sat)
(exit)