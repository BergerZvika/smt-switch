(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvor (bvshl t t) t)) (bvmul s (bvsub t (bvshl t t)))))
(check-sat)
(exit)