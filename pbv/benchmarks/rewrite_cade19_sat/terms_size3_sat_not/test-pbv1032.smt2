(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul t (bvshl s (bvmul s s))) (bvmul s (bvshl t (bvmul s s))))))
(check-sat)
(exit)