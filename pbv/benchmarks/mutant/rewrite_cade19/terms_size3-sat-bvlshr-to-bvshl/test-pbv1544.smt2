(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvlshr (bvmul s t) s) s) (bvmul s (bvlshr (bvlshr t s) s))))
(check-sat)
(exit)