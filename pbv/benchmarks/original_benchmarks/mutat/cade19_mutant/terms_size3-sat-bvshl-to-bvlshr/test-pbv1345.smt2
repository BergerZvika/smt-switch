(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd (bvor s t) (bvlshr t s)) (bvor s (bvadd t (bvshl t s)))))
(check-sat)
(exit)