(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (= (_ bv1 k) (bvmul t (bvshl s s))) (= (_ bv0 k) (bvmul s (bvshl t s)))))
(check-sat)
