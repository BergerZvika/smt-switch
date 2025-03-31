(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (bvshl t t) t)) (bvor s (bvshl (bvadd t t) t))))
(assert (>= k 4))
(check-sat)
(exit)