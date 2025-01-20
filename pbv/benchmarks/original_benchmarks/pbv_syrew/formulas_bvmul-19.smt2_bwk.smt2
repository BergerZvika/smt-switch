(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl s (bvmul s s))) (= (_ bv0 k) (bvmul s s))))
(check-sat)
