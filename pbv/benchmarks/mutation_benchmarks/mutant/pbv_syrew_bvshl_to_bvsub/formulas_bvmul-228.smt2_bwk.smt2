(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bv0 k) (bvmul s (bvsub t s))) (bvult s (bvmul s (bvshl t s)))))
(check-sat)