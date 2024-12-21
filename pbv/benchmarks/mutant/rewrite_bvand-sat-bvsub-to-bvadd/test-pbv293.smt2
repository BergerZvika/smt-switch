(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvmul s s) (bvadd (_ bv1 k) t)) (bvmul s (bvsub s (bvmul s t)))))
(check-sat)
(exit)