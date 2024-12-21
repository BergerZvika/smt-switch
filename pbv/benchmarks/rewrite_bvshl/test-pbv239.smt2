(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvsub t s) t) (bvult (bvsub s (_ bv1 k)) t)))
(check-sat)
(exit)