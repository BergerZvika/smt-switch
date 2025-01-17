(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (distinct (bvadd s s) (bvmul s s)) (distinct s (bvsub (bvmul s s) s))))
(check-sat)
(exit)