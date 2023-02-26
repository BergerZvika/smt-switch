(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvmul s t) (bvudiv s t)) (bvule t (bvudiv s (bvmul s t)))))
(check-sat)
(exit)