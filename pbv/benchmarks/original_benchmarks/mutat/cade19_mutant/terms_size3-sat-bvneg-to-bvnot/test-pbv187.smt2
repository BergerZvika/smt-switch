(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvnot (bvmul s (bvnot s))) (bvadd s (bvmul s s))))
(check-sat)
(exit)