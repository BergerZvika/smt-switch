(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvadd (_ bv1 k) (bvnot s))) (bvlshr s (bvmul s (bvand s (_ bv1 k))))))
(check-sat)