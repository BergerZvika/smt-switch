(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvnot (bvlshr t t))) (bvnot (bvnot s))))
(check-sat)
(exit)