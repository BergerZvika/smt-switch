(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv0 k) (bvmul s (bvor t (_ bv1 k)))) (= s (bvshl s (bvand t (_ bv1 k))))))
(check-sat)
