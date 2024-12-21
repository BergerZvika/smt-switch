(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvsub (bvshl (bvadd s t) (_ bv1 k)) t) (bvadd s (bvadd s t)))))
(check-sat)
(exit)