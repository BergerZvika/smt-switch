(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr s (bvor (bvlshr t s) t)) (bvshl s (bvor t (bvlshr t s)))))
(check-sat)
(exit)