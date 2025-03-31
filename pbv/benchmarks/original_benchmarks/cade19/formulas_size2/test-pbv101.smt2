(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle s (bvor t s)) (bvsle s (bvor s t))))
(check-sat)
(exit)