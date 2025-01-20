(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (= (_ bv0 k) (bvmul t (bvshl s (_ bv1 k)))) (= (_ bv0 k) (bvmul s (bvshl t (_ bv1 k)))))))
(check-sat)
