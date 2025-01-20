(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvshl s (bvmul t (bvshl (_ bv1 k) s))) (bvshl s (bvshl t s))))
(check-sat)
