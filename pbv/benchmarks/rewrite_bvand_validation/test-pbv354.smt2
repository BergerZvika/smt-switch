(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvand s (bvshl (bvnot t) t)) s) (bvshl (bvand s (bvshl s t)) s)))
(check-sat)
(exit)