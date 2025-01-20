(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvshl (bvshl t t) s)) (bvmul s (bvshl (bvshl t s) t))))
(check-sat)
