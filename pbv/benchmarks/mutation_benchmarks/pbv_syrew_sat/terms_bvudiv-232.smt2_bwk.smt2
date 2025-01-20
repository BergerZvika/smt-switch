(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvudiv s (bvshl (_ bv1 k) (bvand s (_ bv1 k)))) (bvlshr s (bvand s (_ bv1 k))))))
(check-sat)
