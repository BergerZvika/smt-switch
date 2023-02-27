(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct s (bvneg (bvadd s (bvmul s t)))) (distinct s (bvmul s (bvnot t)))))
(check-sat)
(exit)