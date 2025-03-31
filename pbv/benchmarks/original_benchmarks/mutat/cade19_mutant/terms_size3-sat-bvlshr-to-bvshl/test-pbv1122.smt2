(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor t (bvor (bvshl t t) s)) (bvor s t)))
(check-sat)
(exit)