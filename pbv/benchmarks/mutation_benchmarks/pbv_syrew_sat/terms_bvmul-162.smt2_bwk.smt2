(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul t (bvshl s (bvshl s (_ bv1 k)))) (bvmul s (bvshl t (bvshl s (_ bv1 k)))))))
(check-sat)
