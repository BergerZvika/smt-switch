(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvneg (bvshl t s))) (bvlshr s (bvneg (bvlshr t s)))))
(check-sat)
(exit)