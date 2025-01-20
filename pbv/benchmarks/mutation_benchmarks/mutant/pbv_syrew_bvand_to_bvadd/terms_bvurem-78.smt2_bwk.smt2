(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr s (bvadd t (bvshl s s))) (bvurem s (bvand s (bvlshr t s)))))
(check-sat)
