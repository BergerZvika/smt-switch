(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s (bvlshr t s)) t) (bvshl (bvshl s t) (bvlshr t s)))))
(check-sat)
(exit)