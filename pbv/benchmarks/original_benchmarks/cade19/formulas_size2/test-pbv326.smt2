(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvadd t s) s) (bvslt (bvadd s t) s)))
(check-sat)
(exit)