(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvmul s (bvor s t)) t) (bvmul s (bvshl (bvor s t) t)))))
(check-sat)
(exit)