(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvsub s t) (bvsub s t)) (bvsub (bvmul s s) (bvmul t t))))
(check-sat)
(exit)