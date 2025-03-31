(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl (bvshl t s) t)) (bvsub s (bvshl (bvshl t s) t))))
(check-sat)
(exit)