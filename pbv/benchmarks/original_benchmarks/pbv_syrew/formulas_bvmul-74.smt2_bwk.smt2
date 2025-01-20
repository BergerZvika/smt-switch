(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= s (bvshl t (bvmul s t))) (= s (bvshl t (bvmul s s)))))
(check-sat)
