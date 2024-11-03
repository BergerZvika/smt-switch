(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvsub (_ bv0 k) (bvshl s s))) (bvule s (bvshl s s))))
;(assert (distinct (bvule s (bvnot (bvshl s s))) (bvule s (bvshl s s))))
(check-sat)
(exit)