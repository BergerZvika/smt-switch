(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvlshr t (bvnot (int_to_pbv k 1)))) s))
(check-sat)
(exit)