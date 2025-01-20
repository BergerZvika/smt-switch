(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvand s (bvurem t (bvlshr (_ bv1 k) t))) (bvand s t)))
(check-sat)
