(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvult s (bvor t t)) (bvult s t))))
(check-sat)
(exit)