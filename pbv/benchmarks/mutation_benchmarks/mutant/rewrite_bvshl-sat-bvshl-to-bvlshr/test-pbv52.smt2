(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvlshr (bvsub (_ bv1 k) t) t)) (bvadd s (bvshl (bvsub t (_ bv1 k)) t))))
(check-sat)
(exit)