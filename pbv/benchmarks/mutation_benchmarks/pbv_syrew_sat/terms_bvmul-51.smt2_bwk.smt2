(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul s (bvmul t (bvshl (_ bv1 k) s))) (bvmul s (bvshl t s)))))
(check-sat)