(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvshl t (bvlshr (_ bv0 k) s))) (bvurem s t)))
(check-sat)
