(set-logic ALL)
(declare-const k Int)
(declare-fun s () (_ BitVec k))
(declare-fun t () (_ BitVec k))
(assert (distinct (bvmul (bvnot s) (bvshl t s)) (bvmul t (bvshl (bvnot s) s))))
(check-sat)