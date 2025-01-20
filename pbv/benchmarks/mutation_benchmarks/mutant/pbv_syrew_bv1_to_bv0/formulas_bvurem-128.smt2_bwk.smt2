(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl s (bvurem (_ bv0 k) s))) (bvule s (_ bv1 k))))
(check-sat)
