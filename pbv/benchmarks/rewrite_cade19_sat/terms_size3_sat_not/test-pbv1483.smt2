(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvand s (bvmul t t)) s) (bvmul s (bvshl (bvand s t) s)))))
(check-sat)
(exit)