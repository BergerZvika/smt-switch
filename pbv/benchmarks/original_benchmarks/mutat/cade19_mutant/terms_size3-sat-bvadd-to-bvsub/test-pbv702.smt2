(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvsub s (bvor (bvlshr t s) t)) (bvadd s (bvor t (bvlshr t s)))))
(check-sat)
(exit)