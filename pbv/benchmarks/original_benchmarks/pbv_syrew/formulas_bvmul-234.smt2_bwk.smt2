(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bv0 k) (bvmul s (bvand t (_ bv1 k)))) (distinct s (bvshl s (bvand t (_ bv1 k))))))
(check-sat)
