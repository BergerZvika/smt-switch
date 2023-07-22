(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-const m Int)
(declare-const x (_ BitVec k))
(assert (= x (_ bv0 8)))
; suppposed to be sat
(check-sat)
(exit)