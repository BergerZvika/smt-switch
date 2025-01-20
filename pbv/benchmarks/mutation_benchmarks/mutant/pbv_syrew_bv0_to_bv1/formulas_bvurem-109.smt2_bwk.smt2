(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvurem s (bvurem t (_ bv1 k)))) (distinct s (bvurem s t))))
(check-sat)