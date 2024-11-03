(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvshl (bvor t (_ bv1 k)) s) s)) (bvshl s (bvshl (bvshl t s) (bvshl s s)))))
(check-sat)
(exit)