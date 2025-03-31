(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvshl t (bvshl t t))) (bvor s t)))
(check-sat)
(exit)