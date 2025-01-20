(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvor (_ bv1 k) (bvmul t t))) (= s (bvand t (_ bv1 k)))))
(check-sat)