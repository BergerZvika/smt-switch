(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvmul s (bvsub s s))) (bvmul s (bvmul s (bvadd t t)))))
(check-sat)
(exit)