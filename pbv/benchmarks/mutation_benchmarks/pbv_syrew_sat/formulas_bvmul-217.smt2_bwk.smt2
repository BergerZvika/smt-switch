(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (distinct (_ bv0 k) (bvmul s (bvshl s s))) (bvult s (bvmul s (bvshl s s))))))
(check-sat)
