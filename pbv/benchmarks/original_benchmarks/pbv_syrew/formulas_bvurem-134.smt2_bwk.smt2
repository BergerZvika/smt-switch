(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvurem s (bvlshr (_ bv1 k) t))) (distinct s (bvshl s (bvlshr (_ bv1 k) t)))))
(check-sat)
