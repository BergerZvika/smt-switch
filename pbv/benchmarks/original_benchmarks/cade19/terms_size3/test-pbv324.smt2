(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvmul t (bvneg t))) (bvneg (bvmul s (bvmul t t)))))
(check-sat)
(exit)