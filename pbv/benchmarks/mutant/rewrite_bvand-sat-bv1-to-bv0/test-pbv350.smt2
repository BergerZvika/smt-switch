(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvsub t s) (bvsub t (_ bv0 k))) (bvmul (bvsub s t) (bvsub (_ bv1 k) t))))
(check-sat)
(exit)