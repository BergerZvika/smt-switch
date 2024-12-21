(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvand s t) (bvshl s t)) s) (bvshl (bvshl (bvand s t) s) (bvshl s t))))
(check-sat)
(exit)