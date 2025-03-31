(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvadd s t) t) (bvult (bvneg s) t)))
(check-sat)
(exit)