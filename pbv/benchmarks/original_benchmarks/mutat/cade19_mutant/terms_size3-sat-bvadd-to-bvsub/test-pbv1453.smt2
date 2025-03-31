(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvshl s (bvor s t)) t) (bvsub (bvshl s (bvor s t)) t)))
(check-sat)
(exit)