(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvmul s (bvshl t t))) (= s (_ bvk k))))
(check-sat)
