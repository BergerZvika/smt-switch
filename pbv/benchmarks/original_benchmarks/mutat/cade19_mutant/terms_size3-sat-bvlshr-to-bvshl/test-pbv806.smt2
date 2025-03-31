(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvadd (bvshl t t) s)) (bvadd s s)))
(check-sat)
(exit)