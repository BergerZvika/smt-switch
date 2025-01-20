(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvshl (_ bv0 k) (bvlshr (_ bv1 k) t))) (bvand s (bvlshr (_ bv1 k) t))))
(check-sat)
