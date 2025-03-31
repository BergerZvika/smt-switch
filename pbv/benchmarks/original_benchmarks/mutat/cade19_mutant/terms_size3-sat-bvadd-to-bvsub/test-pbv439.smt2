(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvsub t (bvlshr t t))) (bvor s t)))
(check-sat)
(exit)