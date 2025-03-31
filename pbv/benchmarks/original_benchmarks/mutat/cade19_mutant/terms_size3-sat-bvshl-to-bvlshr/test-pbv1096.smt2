(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr t (bvand (bvlshr t s) s)) (bvadd (bvlshr s s) t)))
(check-sat)
(exit)