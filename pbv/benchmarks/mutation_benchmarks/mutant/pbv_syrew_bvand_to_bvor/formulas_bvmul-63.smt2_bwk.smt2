(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvor t (bvmul s s))) (distinct s (bvand s (bvand t (_ bv1 k))))))
(check-sat)
