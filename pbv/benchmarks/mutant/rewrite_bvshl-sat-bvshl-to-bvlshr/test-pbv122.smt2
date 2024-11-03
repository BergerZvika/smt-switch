(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvsub s t) t) s) (bvshl (bvshl (bvsub s t) s) t)))
(check-sat)
(exit)