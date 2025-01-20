(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvurem s (bvshl (_ bv0 k) t))) (bvurem s (bvshl (_ bv1 k) t))))
(check-sat)
