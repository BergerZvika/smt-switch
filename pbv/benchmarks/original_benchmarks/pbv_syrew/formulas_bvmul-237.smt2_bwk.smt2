(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvmul s (bvshl (_ bv1 k) t))) (= (_ bv0 k) (bvshl s t))))
(check-sat)
