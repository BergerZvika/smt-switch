(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvule s (bvurem t (bvurem t (_ bvk k)))) (= s (_ bv0 k))))
(check-sat)
