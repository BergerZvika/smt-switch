(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvand s (bvlshr (_ bv1 k) t))) (distinct s (bvmul s (bvshl s t))))))
(check-sat)
