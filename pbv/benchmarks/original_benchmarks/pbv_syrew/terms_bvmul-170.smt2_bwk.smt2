(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul t (bvshl (bvshl s s) s)) (bvmul s (bvshl (bvshl t s) s))))
(check-sat)
