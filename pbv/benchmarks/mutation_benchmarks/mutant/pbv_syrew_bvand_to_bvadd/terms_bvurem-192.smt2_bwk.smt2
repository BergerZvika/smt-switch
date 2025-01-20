(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvadd s (bvshl (_ bv1 k) (bvurem t (_ bv0 k)))) (bvand s (bvshl (_ bv1 k) t))))
(check-sat)
