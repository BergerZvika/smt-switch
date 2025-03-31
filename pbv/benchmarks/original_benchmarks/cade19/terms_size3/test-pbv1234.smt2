(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl (bvshl s s) (bvlshr t s)) (bvshl s (bvadd s (bvlshr t s)))))
(check-sat)
(exit)