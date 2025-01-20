(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct s (bvand s (bvurem t s))) (distinct s (_ bv0 k)))))
(check-sat)
