(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvudiv s (bvudiv (_ bv1 k) (bvand s (_ bv1 k)))) (bvshl s (bvudiv (_ bv0 k) (bvand s (_ bv1 k)))))))
(check-sat)