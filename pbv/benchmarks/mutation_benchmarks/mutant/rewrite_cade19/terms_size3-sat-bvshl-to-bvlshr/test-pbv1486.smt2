(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvlshr s (bvmul t t)) t) (bvshl (bvlshr s t) (bvmul t t))))
(check-sat)
(exit)