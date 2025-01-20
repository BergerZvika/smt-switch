(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (not (distinct (bvmul s (bvshl (_ bv1 k) s)) (bvshl s s))))
(check-sat)
