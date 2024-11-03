(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsub (_ bv0 k) (bvshl (bvsub s (_ bv1 k)) t)) (bvshl (bvsub (_ bv1 k) s) t))))
(check-sat)
(exit)