(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s t) (bvlshr t s)) (bvadd (bvshl s t) (bvlshr t s))))
(check-sat)
(exit)