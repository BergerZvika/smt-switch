(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul t (bvshl s s)) (bvmul s (bvshl t s))))
(check-sat)