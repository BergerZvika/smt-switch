(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvand (_ bv1 k) (bvurem t (_ bvk k)))) (bvurem s (bvand t (_ bv1 k)))))
(check-sat)
