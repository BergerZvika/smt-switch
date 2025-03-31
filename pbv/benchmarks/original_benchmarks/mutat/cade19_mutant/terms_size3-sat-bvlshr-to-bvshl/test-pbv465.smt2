(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvshl t (bvshl t t))) (bvadd s t)))
(check-sat)
(exit)