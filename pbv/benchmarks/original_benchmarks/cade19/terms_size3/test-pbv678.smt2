(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvadd (bvlshr t s) t)) (bvadd s (bvadd t (bvlshr t s)))))
(check-sat)
(exit)