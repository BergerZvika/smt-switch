(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvshl s (bvlshr (_ bv1 k) t))) (bvult t (bvurem s t)))))
(check-sat)
