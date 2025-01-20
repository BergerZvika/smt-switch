(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl (_ bv0 k) (bvshl s (bvshl (_ bv1 k) (_ bv1 k)))) (bvlshr (_ bv1 k) (bvmul s s))))
(check-sat)
