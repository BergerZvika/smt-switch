(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl (bvsub (_ bv0 k) s) t) s) (bvshl (bvshl (bvsub (_ bv1 k) s) s) t)))
(check-sat)
(exit)