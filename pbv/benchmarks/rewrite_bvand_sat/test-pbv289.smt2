(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul (bvmul s s) (bvadd s (_ bv1 k))) (bvmul s (bvadd s (bvmul s s))))))
(check-sat)
(exit)