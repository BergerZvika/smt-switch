(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvadd t t) s)) (bvmul s (bvshl (bvshl t s) s))))
(check-sat)
(exit)