(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (distinct (_ bv1 k) (bvmul s (bvmul s s))) (distinct (_ bv0 k) (bvmul s s))))
(check-sat)
