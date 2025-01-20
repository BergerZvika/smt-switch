(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand (_ bv1 k) (bvadd s (bvand s (_ bv1 k)))) (bvand s (_ bv1 k))))
(check-sat)
