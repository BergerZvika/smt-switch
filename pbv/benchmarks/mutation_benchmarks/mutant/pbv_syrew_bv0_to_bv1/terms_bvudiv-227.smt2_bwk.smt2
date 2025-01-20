(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvlshr (_ bv1 k) (bvnot t))) (bvand s (bvudiv t (bvnot (_ bv1 k))))))
(check-sat)
