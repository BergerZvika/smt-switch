(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvshl (_ bv1 k) (bvurem (_ bv1 k) t))) (bvor s (bvurem (_ bv1 k) t))))
(check-sat)
