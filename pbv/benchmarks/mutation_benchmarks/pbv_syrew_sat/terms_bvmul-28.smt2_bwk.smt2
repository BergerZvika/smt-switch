(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvmul s (bvlshr (_ bv1 k) t))) (bvmul s (bvlshr (_ bv1 k) t)))))
(check-sat)
