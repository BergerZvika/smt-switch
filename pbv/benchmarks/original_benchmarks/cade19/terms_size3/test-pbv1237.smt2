(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvshl s s) (bvshl t s)) (bvshl (bvor s t) s)))
(check-sat)
(exit)