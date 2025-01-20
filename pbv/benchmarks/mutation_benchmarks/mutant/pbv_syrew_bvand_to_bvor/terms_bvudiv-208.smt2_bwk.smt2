(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor s (bvudiv (_ bv0 k) (bvshl s (_ bv1 k)))) (bvand s (bvshl s (bvshl s (_ bv1 k))))))
(check-sat)
