(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvurem t (bvurem t (_ bvk k)))) (_ bv0 k)))
(check-sat)
