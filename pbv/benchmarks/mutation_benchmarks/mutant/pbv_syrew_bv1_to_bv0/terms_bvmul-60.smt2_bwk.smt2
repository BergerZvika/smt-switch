(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvshl t (bvshl (_ bv0 k) t))) (bvmul s (bvshl t (bvshl t t)))))
(check-sat)
