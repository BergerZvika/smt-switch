(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvlshr (_ bv0 k) (bvshl t s))) (bvurem s (bvshl s (bvshl t s)))))
(check-sat)
