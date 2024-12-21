(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvadd s s) (bvor s (_ bv1 k))) (bvmul s (bvmul s (bvadd s s)))))
(check-sat)
(exit)