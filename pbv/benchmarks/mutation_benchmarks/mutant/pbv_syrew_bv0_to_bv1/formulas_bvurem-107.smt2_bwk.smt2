(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl s (bvurem t (_ bv1 k)))) (bvult s (bvshl s t))))
(check-sat)
