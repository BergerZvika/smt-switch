(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvmul (bvnot t) t)) (bvneg (bvmul s (bvmul t t)))))
(check-sat)
(exit)