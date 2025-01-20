(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvshl (bvshl t s) t) (_ bv1 k))) (bvshl s (bvshl (bvshl (bvand s t) s) t))))
(check-sat)
(exit)