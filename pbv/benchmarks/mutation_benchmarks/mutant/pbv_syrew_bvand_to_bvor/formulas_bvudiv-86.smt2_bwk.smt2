(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvudiv s (bvor s t))) (bvule (bvand s t) (_ bv1 k))))
(check-sat)
