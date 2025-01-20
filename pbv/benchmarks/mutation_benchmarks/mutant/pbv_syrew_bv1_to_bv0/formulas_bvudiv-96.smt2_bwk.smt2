(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvudiv s (bvshl s (_ bv0 k)))) (distinct s s)))
(check-sat)
