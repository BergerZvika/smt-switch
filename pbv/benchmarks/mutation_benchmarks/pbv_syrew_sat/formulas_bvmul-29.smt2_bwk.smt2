(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= s (bvmul s (bvshl t s))) (= s (_ bv0 k)))))
(check-sat)
