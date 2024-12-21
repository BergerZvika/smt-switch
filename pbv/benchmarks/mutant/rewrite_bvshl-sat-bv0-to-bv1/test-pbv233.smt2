(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvsub s t) (_ bv1 k)) (= (_ bv1 k) (bvsub s t))))
(check-sat)
(exit)