(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvsub (bvlshr t s) t)) (bvlshr s (bvadd t (bvlshr t s)))))
(check-sat)
(exit)