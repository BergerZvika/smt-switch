(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvlshr t (bvlshr t (bvand t t))) (bvsub (bvlshr s s) t)))
(check-sat)
(exit)