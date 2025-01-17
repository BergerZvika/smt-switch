(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvadd s t) (bvshl s s)) (bvmul s (bvlshr t (bvshl s s)))))
(check-sat)
(exit)