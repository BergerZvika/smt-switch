(set-logic ALL)
(set-option :produce-models true)
(set-option :incremental true)
(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult (bvadd s t) t) (bvult (bvadd s t) s))))
(check-sat)
(exit)