(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl t (bvand (bvlshr t t) s)) (bvsub (bvlshr s s) t)))
(check-sat)
(exit)