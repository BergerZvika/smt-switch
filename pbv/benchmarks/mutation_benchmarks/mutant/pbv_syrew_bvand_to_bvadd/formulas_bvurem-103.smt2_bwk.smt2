(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct s (bvadd s (bvurem t (_ bv0 k)))) (distinct s (bvand s t))))
(check-sat)
