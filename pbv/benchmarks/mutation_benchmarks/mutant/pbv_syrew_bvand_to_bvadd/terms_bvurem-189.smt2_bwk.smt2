(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvadd (_ bv1 k) (bvurem t (_ bv0 k)))) (bvshl s (bvand t (_ bv1 k)))))
(check-sat)
