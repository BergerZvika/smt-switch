(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvmul (bvneg t) t)) (bvshl s (bvmul t (bvnot t)))))
(check-sat)
(exit)