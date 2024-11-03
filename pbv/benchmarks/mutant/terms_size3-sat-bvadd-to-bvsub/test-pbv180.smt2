(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvor t (_ bv0 k)) (_ bv0 k)) (bvsub (bvlshr s s) t)))
(check-sat)
(exit)