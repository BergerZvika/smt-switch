(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvmul s t) (bvmul t t)) (bvmul (bvadd s t) t)))
(check-sat)
(exit)