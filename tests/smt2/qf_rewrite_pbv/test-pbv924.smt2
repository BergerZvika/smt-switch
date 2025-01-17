(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvmul s (bvnot (bvneg t)))) (bvule s (bvsub (bvmul s t) s))))
(check-sat)
(exit)