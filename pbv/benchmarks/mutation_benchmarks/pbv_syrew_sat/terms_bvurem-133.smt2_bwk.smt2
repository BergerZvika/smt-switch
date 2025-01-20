(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvurem s (bvshl t (bvshl (_ bv1 k) t))) (bvurem s (bvshl t (bvshl t t))))))
(check-sat)
