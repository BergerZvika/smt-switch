(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd (_ bv1 k) (bvmul s (bvlshr t s))) (bvand s (bvand (_ bv1 k) (bvlshr t s)))))
(check-sat)