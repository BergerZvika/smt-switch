(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (= s (bvshl (bvsub (_ bv1 k) (_ bv1 k)) s)) (distinct s s)))
(check-sat)
(exit)