(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvneg (bvmul s (bvnot s))) (bvsub s (bvmul s s))))
(check-sat)
(exit)