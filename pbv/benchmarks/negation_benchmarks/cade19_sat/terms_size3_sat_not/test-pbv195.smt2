(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvneg (bvadd s (bvmul s t))) (bvmul s (bvnot t)))))
(check-sat)
(exit)