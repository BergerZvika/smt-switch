(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvmul (bvneg t) t)) (bvadd s (bvmul t (bvnot t)))))
(check-sat)
(exit)