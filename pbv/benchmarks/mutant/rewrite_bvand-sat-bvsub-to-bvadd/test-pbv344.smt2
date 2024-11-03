(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvadd s (_ bv1 k)) (bvadd (_ bv1 k) s)) (bvsub (_ bv1 k) (bvmul s s))))
(check-sat)
(exit)