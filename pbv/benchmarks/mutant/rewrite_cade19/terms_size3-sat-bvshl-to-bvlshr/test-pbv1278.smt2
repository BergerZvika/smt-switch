(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvmul s t) (bvlshr s t)) (bvmul t (bvlshr s (bvshl s t)))))
(check-sat)
(exit)