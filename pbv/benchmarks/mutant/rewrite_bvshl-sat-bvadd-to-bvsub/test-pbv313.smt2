(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvsub (_ bv0 k) (bvsub s (_ bv1 k)))) (bvule s (bvadd s s))))
(check-sat)
(exit)