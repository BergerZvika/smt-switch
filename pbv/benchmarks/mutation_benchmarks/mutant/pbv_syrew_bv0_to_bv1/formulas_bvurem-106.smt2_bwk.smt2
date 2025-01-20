(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl s (bvurem t (_ bv1 k)))) (= s (bvshl s t))))
(check-sat)