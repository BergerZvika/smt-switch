(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvneg (bvadd s (bvmul s s))) (bvmul s (bvneg s))))
(check-sat)
(exit)