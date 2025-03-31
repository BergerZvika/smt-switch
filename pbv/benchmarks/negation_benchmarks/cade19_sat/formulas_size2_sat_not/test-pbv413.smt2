(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (and (bvult s t) true) (bvult s t))))
(check-sat)
(exit)