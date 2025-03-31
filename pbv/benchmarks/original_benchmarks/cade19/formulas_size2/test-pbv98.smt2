(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult s (bvor t s)) (bvult s (bvor s t))))
(check-sat)
(exit)