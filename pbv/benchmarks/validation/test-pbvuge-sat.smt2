(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const x (_ BitVec k))
(assert (bvuge x x))
(check-sat)
(exit)
