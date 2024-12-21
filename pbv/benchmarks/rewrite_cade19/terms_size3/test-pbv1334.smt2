(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr s t) (bvmul t t)) (bvlshr (bvlshr s t) t)))
(check-sat)
(exit)