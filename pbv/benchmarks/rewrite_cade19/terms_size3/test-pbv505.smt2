(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvlshr t (bvmul t (_ bv0 k)))) (bvadd s t)))
(check-sat)
(exit)