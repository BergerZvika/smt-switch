(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvand s (bvmul s s))) (bvule s (_ bv1 k))))
(check-sat)
