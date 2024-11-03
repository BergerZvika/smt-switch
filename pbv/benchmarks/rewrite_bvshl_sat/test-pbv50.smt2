(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsub s (bvshl (bvsub (_ bv1 k) t) s)) (bvadd s (bvshl (bvsub t (_ bv1 k)) s)))))
(check-sat)
(exit)