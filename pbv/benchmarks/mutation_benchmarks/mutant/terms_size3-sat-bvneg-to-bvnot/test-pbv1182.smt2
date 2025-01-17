(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvnot s) (bvmul s t)) (bvmul s (bvnot (bvneg t)))))
(check-sat)
(exit)