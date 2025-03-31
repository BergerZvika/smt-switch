(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvor s t) (bvshl t s)) (bvor s (bvor t (bvlshr t s)))))
(check-sat)
(exit)