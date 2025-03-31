(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (or false (bvsle s t)) (bvsle s t)))
(check-sat)
(exit)