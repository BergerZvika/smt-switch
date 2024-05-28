(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s s) (bvshl (bvshl s s) t)) (bvshl (bvand s (bvshl s t)) s)))
(check-sat)
(exit)