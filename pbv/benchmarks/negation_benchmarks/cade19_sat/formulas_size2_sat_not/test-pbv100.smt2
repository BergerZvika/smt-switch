(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvslt s (bvor t s)) (bvslt s (bvor s t)))))
(check-sat)
(exit)