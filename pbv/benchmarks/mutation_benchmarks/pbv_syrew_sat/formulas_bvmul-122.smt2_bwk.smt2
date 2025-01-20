(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvand (_ bv1 k) (bvmul t t))) (distinct s (bvand t (_ bv1 k))))))
(check-sat)
