(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct (bvneg t) (bvmul s t)) (distinct t (bvneg (bvmul s t)))))
(check-sat)
(exit)