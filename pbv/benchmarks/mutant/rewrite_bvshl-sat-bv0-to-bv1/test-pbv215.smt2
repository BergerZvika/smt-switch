(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule (_ bv1 k) (bvsub s t)) (distinct (_ bv1 k) (bvsub s t))))
(check-sat)
(exit)