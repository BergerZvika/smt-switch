(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvshl (bvsub s t) (_ bv1 k)) s) (bvsub s (bvsub t t))))
(check-sat)
(exit)