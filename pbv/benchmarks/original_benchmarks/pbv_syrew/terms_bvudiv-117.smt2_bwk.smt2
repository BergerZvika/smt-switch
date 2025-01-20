(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvand t (bvudiv s s))) (bvand s (bvand t (_ bv1 k)))))
(check-sat)
