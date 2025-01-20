(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvurem (_ bv1 k) (bvlshr (_ bv1 k) t))) (bvand s (bvurem (_ bv1 k) (bvsub (_ bv1 k) t)))))
(check-sat)
