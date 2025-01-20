(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvshl s (bvudiv s s))) (= s (_ bv0 k)))))
(check-sat)
