(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvand t (bvurem t (_ bv1 k)))) (bvule s t)))
(check-sat)
