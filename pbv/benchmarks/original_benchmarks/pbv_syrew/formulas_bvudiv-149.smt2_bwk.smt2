(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl s (bvudiv (_ bv1 k) s))) (= s (_ bv1 k))))
(check-sat)
