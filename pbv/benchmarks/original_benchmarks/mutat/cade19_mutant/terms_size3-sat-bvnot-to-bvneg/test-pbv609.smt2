(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvmul (bvneg t) t)) (bvor s (bvmul t (bvnot t)))))
(check-sat)
(exit)