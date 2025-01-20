(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvor s (bvurem t (bvlshr (_ bv1 k) s))) (bvand s t)))
(check-sat)
