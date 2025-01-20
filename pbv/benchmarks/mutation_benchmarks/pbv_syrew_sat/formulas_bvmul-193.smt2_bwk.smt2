(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= t (bvshl s (bvmul t t))) (= s (bvshl t (bvmul s s))))))
(check-sat)
