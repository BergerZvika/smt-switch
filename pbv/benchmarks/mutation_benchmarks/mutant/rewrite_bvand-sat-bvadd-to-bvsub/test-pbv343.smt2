(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvsub s (_ bv1 k)) (bvmul t t)) (bvmul t (bvadd t (bvmul s t)))))
(check-sat)
(exit)