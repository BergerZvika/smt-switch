(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvlshr (_ bv1 k) (bvmul s (bvshl s (_ bv1 k)))) (bvlshr (_ bv1 k) (bvmul s s))))
(check-sat)
