(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvadd s t) (bvsub t s)) (bvult (bvadd s t) (bvadd s s))))
(check-sat)
(exit)