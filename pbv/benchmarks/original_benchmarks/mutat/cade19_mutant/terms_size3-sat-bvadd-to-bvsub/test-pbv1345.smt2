(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub (bvor s t) (bvshl t s)) (bvor s (bvadd t (bvshl t s)))))
(check-sat)
(exit)