(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (distinct s (bvshl (bvsub (_ bv1 k) s) s)) (= s s))))
(check-sat)
(exit)