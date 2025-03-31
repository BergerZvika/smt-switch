(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvor t (bvlshr t t))) (bvand s (bvadd t (bvshl t t)))))
(check-sat)
(exit)