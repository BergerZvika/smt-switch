(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvmul s (bvneg s))) (bvmul s (bvmul t (bvnot s)))))
(check-sat)
(exit)