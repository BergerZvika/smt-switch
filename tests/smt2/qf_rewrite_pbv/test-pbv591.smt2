(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvudiv (bvsub s t) t) s) (bvult (bvudiv (bvsub s t) s) t)))
(check-sat)
(exit)