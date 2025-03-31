(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (bvshl s t) (bvshl t t)) (bvshl (bvadd s t) t))))
(check-sat)
(exit)