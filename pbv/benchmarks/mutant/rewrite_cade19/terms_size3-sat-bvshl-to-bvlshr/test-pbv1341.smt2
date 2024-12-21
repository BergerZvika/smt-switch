(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvor s t) (bvlshr s t)) (bvmul s (bvshl (bvor s t) t))))
(check-sat)
(exit)