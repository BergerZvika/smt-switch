(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvshl (bvnot (_ bv0 k)) s) t) (bvnot (bvshl t s))))
(check-sat)
(exit)