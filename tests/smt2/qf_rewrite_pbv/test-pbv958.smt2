(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvmul s (bvnot (bvudiv s s)))) (bvule s (bvneg (bvadd s s)))))
(check-sat)
(exit)