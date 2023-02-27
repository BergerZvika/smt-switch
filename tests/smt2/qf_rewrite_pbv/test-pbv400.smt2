(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct (bvnot t) (bvmul s t)) (distinct t (bvnot (bvmul s t)))))
(check-sat)
(exit)