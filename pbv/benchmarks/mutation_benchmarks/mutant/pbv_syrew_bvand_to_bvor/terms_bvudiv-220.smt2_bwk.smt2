(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor s (bvudiv (_ bv0 k) (bvshl (_ bv1 k) t))) (bvand s (bvudiv t (bvshl (_ bv1 k) t)))))
(check-sat)
