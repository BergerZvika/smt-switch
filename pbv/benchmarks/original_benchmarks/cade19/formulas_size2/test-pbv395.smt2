(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (and true (bvsle s t)) (bvsle s t)))
(check-sat)
(exit)