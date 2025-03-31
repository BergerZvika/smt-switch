(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor (bvor s t) (bvlshr t s)) (bvor s (bvor t (bvshl t s)))))
(check-sat)
(exit)