(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvor s t) t) (bvslt s (bvor s t))))
(check-sat)
(exit)