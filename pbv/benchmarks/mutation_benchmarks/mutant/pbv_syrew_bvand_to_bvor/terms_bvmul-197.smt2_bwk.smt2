(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor (_ bv1 k) (bvmul s (bvlshr (_ bv1 k) t))) (bvand s (bvlshr (_ bv1 k) t))))
(check-sat)
