(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvlshr t (bvshl t t))) (bvlshr s (bvlshr t (bvshl t t)))))
(check-sat)
(exit)