(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (_ bv0 k) (bvmul s (bvmul s s))) (bvlshr (_ bv1 k) (bvmul s s))))
(check-sat)
