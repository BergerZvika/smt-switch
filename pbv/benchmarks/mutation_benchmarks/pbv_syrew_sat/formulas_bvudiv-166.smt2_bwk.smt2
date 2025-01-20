(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvule s (bvand t (bvudiv s s))) (bvule s (bvand t (_ bv1 k))))))
(check-sat)