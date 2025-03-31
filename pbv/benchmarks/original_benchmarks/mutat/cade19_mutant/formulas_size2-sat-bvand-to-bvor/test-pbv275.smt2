(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvor s t) t) (bvult s (bvor s t))))
(check-sat)
(exit)