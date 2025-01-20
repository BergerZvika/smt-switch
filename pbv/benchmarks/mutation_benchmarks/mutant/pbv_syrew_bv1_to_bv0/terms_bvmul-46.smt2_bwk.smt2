(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvshl t (bvshl (_ bv0 k) s))) (bvmul s (bvshl t (bvshl s s)))))
(check-sat)
