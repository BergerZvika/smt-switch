(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsle s (bvadd t s)) (bvsle s (bvadd s t))))
(check-sat)
(exit)