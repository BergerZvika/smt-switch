(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvneg (bvlshr t t))) (bvnot (bvneg s))))
(check-sat)
(exit)