(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvshl (bvsub (_ bv0 k) t) t)) (bvadd s (bvshl t t))))
(check-sat)
(exit)