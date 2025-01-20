(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvudiv (_ bv1 k) (bvshl t t))) (bvand s (bvudiv t (bvshl t t)))))
(check-sat)
