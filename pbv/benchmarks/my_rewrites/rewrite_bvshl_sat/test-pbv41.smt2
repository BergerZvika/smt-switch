(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl s (bvshl (bvsub (_ bv0 k) t) t)) (bvshl s (bvsub (_ bv0 k) (bvshl t t))))))
(check-sat)
(exit)