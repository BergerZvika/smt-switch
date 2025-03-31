(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvshl (bvlshr t s) t)) (bvlshr s (bvshl (bvlshr t s) t))))
(check-sat)
(exit)