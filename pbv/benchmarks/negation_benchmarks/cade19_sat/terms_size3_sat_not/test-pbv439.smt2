(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor s (bvadd t (bvlshr t t))) (bvor s t))))
(check-sat)
(exit)