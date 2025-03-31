(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd t (bvand (bvlshr t t) s)) (bvadd s t)))
(check-sat)
(exit)