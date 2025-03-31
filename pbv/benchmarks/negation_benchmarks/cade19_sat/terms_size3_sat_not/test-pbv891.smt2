(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvshl (bvshl t t) t)) (bvadd s (bvshl (bvadd t t) t)))))
(check-sat)
(exit)