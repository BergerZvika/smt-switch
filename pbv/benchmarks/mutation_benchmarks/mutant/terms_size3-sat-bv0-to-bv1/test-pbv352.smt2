(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvadd t (bvnot (_ bv1 k)))) (bvmul s (bvnot (bvneg t)))))
(check-sat)
(exit)