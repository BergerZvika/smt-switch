(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvadd t (bvshl t t))) (bvshl s t)))
(check-sat)
(exit)