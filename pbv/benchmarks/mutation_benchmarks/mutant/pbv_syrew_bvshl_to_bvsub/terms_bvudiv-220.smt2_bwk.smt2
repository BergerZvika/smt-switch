(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvudiv (_ bv0 k) (bvsub (_ bv1 k) t))) (bvand s (bvudiv t (bvshl (_ bv1 k) t)))))
(check-sat)
