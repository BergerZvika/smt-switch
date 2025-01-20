(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl s (bvudiv s s))) (bvult s (bvshl s (_ bv0 k)))))
(check-sat)
