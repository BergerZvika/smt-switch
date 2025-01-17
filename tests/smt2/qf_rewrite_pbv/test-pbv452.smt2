(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (bvudiv s s) (bvmul s t)) (distinct s (bvadd s (bvmul s t)))))
(check-sat)
(exit)