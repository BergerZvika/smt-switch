(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvmul (bvnot (_ bv0 k)) t)) (bvneg (bvmul s t)))))
(check-sat)
(exit)