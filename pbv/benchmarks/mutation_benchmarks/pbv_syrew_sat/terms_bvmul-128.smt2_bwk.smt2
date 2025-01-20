(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul s (bvshl (bvmul t t) (_ bv1 k))) (bvmul s (bvmul t (bvshl t (_ bv1 k)))))))
(check-sat)