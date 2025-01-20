(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvmul s (bvmul s t)) t) (bvmul s (bvmul s (bvshl t t)))))
(check-sat)
(exit)