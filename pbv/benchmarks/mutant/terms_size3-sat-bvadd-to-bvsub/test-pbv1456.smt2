(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvmul s (bvshl s t)) t) (bvsub (bvmul s (bvshl s t)) t)))
(check-sat)
(exit)