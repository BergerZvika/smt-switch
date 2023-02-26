(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct s (bvnot (bvudiv (bvadd s s) s))) (distinct s (bvneg (bvmul s s)))))
(check-sat)
(exit)