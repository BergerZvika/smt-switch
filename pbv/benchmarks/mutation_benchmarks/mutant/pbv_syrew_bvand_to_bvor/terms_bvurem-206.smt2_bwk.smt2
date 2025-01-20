(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvurem (_ bv1 k) (bvor t (_ bv1 k)))) (bvshl s (bvand (_ bv1 k) (bvnot t)))))
(check-sat)