(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvurem (_ bv1 k) (bvand t (_ bv1 k)))) (bvand s (bvand (_ bv1 k) (bvnot t)))))
(check-sat)
