(set-logic ALL)
(set-option :produce-models true)
(declare-const k Int)
(declare-const m Int)
(declare-const x (_ BitVec k))
(assert (= x (_ bv0 m)))
(assert (distinct m k))
; suppposed to be unsat -- also create a similar SAT one witohut the final assertion
(check-sat)
(exit)