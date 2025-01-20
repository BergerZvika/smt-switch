(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (_ bv0 k) (bvmul s (bvshl s t))) (bvand s (bvlshr (_ bv1 k) t))))
(check-sat)