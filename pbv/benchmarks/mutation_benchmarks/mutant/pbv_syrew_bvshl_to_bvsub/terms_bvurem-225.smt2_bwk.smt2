(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub s (bvurem (_ bv1 k) (bvlshr (_ bv1 k) t))) (bvshl s (bvurem (_ bv1 k) (bvshl (_ bv1 k) t)))))
(check-sat)
