(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvlshr (_ bv1 k) (bvlshr (_ bv1 k) t))) (bvand s (bvurem (_ bv1 k) (bvshl (_ bv1 k) t)))))
(check-sat)
