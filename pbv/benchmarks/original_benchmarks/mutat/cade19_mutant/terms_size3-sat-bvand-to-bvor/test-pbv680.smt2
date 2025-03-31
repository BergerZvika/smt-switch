(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvadd (bvlshr t s) t)) (bvand s (bvadd t (bvlshr t s)))))
(check-sat)
(exit)