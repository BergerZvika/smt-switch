(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr t (bvand (bvlshr t t) s)) (bvlshr (bvor s t) s)))
(check-sat)
(exit)