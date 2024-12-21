(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvadd t s) (_ bv1 k)) (bvslt (bvadd s t) (_ bv0 k))))
(check-sat)
(exit)