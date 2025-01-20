(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsub s (bvshl (bvsub (_ bv0 k) (_ bv1 k)) t)) (bvadd s (bvshl (_ bv1 k) t)))))
(check-sat)
(exit)