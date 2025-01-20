(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvand s (bvand t (bvudiv t t))) (bvand s (bvand t (_ bv1 k))))))
(check-sat)
