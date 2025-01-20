(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvshl t (bvlshr (_ bv1 k) t))) (bvurem s t)))
(check-sat)
