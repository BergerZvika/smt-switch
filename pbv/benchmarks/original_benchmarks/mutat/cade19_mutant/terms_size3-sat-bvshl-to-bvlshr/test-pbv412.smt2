(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvlshr t (bvor s t))) (bvadd s (bvshl t (bvor s t)))))
(check-sat)
(exit)