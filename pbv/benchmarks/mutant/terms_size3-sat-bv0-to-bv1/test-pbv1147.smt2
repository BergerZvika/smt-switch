(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr t (bvor (bvmul t (_ bv1 k)) s)) (bvlshr (bvor s t) s)))
(check-sat)
(exit)