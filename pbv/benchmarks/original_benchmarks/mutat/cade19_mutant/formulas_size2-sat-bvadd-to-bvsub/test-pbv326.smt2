(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvslt (bvsub t s) s) (bvslt (bvadd s t) s)))
(check-sat)
(exit)