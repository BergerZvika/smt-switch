(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvmul s (bvlshr (_ bv0 k) t))) (= s (bvshl s (bvlshr (_ bv1 k) t)))))
(check-sat)
