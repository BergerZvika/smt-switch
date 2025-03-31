(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvmul (bvnot t) t)) (bvadd s (bvneg (bvmul t t)))))
(check-sat)
(exit)