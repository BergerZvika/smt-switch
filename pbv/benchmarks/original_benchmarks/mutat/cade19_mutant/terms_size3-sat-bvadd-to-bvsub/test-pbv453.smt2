(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvlshr t (bvlshr t t))) (bvadd s t)))
(check-sat)
(exit)