(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const x (_ BitVec k))
(assert (bvsgt x (_ bv0 k)))
(check-sat)
(exit)