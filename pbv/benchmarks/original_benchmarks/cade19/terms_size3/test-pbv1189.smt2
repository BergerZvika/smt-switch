(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul (bvnot s) (bvshl t s)) (bvmul t (bvshl (bvnot s) s))))
(check-sat)
(exit)