(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd t (bvmul s (bvnot s))) (bvmul s (bvmul t (bvnot s)))))
(check-sat)
(exit)