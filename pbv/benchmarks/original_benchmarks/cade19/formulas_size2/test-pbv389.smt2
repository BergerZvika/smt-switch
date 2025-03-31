(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (and true (bvult s t)) (bvult s t)))
(check-sat)
(exit)