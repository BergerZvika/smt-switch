(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul s (bvlshr (_ bv1 k) (bvshl s s))) (bvlshr s (bvshl s s))))
(check-sat)