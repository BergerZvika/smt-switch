(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvand s (bvshl t (bvshl t s))) (bvand s (bvlshr t (bvshl t s)))))
(check-sat)
(exit)