(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct (bvmul s s) (bvudiv s s)) (distinct s (bvudiv s (bvmul s s)))))
(check-sat)
(exit)