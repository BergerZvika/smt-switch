(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvshl s (bvand t (bvshl s s))) (bvand s (bvadd s (bvlshr t s)))))
(check-sat)
(exit)