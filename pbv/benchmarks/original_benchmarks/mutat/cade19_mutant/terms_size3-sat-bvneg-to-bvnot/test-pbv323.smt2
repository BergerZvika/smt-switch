(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvmul t (bvnot t))) (bvadd s (bvneg (bvmul t t)))))
(check-sat)
(exit)