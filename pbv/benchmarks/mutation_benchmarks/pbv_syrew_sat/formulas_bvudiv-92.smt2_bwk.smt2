(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvudiv s (bvand s (_ bv1 k)))) (= (_ bv0 k) (bvand s (_ bv1 k))))))
(check-sat)