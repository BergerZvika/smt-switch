(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvor t (bvurem t (_ bv0 k)))) (bvule s t)))
(check-sat)
