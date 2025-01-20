(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvshl s s) (bvlshr t s)) (bvshl s (bvadd s (bvlshr t s))))))
(check-sat)
(exit)