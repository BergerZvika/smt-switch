(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvshl (bvshl t t) s) t)) (bvshl s (bvshl (bvshl (bvor s t) s) t))))
(check-sat)
(exit)