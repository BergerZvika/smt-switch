(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr (bvshl (bvand s t) t) s) (bvmul s (bvshl (bvshl t s) t))))
(check-sat)
(exit)