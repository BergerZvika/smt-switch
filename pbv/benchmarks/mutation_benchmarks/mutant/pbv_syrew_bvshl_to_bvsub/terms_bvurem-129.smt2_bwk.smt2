(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvsub s (bvurem t (bvlshr (_ bv1 k) s))) (bvshl s t)))
(check-sat)
