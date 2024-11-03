(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct s (bvshl (bvsub (_ bv1 k) s) t)) (distinct s (bvsub (_ bv0 k) (bvshl s t)))))
(check-sat)
(exit)