(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvshl (bvmul s t) (bvnot s)) (bvmul s (bvshl t (bvnot s))))))
(check-sat)
(exit)