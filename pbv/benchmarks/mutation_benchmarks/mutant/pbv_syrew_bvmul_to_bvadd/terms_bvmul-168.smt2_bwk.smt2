(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand t (bvand (_ bv1 k) (bvadd s s))) (bvand s (bvand t (_ bv1 k)))))
(check-sat)
