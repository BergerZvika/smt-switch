(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvadd s (bvmul (bvadd t t) t)) (bvadd s (bvmul t (bvadd t t)))))
(check-sat)
(exit)