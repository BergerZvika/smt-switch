(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvlshr (_ bv0 k) (bvand t (_ bv1 k)))) (bvlshr s (bvmul s (bvand t (_ bv1 k))))))
(check-sat)
