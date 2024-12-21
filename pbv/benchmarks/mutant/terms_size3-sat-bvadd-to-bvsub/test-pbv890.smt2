(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvor (bvshl t t) t)) (bvshl s (bvor t (bvsub t t)))))
(check-sat)
(exit)