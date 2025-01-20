(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvurem s (bvand t (bvurem t (_ bvk k)))) (bvurem s t)))
(check-sat)