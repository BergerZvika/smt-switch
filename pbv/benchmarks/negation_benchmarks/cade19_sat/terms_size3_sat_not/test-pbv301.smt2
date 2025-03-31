(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor s (bvadd s (bvshl t s))) (bvadd s (bvshl t s)))))
(check-sat)
(exit)