(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd s (bvneg (bvlshr t t))) s)))
(check-sat)
(exit)