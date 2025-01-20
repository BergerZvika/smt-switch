(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvurem s (bvlshr t s))) (bvurem s (bvlshr t s)))))
(check-sat)
