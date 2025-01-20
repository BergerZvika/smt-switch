(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvlshr s (bvsub s (_ bv1 k)))) (bvlshr s (bvshl s (bvand s (_ bv1 k))))))
(check-sat)