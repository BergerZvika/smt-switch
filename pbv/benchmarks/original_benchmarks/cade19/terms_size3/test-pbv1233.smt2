(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand (bvshl s s) (bvlshr t s)) (bvand (bvadd s s) (bvlshr t s))))
(check-sat)
(exit)