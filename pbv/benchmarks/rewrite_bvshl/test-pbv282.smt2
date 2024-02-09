(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvadd s (bvsub t (_ bv1 k)))) (bvult s (bvsub (_ bv1 k) t))))
(check-sat)
(exit)