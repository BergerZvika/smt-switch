(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct s (bvsub (_ bv1 k) (bvshl t s))) (distinct t (bvshl s t))))
(check-sat)
(exit)