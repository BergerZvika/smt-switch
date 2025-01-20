(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvult s (bvshl (bvmul s t) t)) (bvult s (bvmul s (bvshl t t)))))
(check-sat)
