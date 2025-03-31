(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvneg (int_to_pbv k 0)) (bvlshr t s)) (bvand (bvnot s) (bvshl t s))))
(check-sat)
(exit)