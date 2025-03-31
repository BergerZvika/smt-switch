(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvlshr (bvlshr s t) t)) (bvor s (bvlshr s (bvlshr t t)))))
(check-sat)
(exit)