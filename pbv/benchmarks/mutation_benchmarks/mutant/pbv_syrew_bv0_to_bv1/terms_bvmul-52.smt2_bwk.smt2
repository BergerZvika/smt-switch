(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvand t (bvlshr (_ bv1 k) s))) (_ bv1 k)))
(check-sat)
