(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle s (bvsub t s)) (bvsle s (bvadd s t))))
(check-sat)
(exit)