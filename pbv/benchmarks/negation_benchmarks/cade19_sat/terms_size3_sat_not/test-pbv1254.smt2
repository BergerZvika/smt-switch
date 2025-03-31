(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvadd (bvadd s t) (bvmul t t)) (bvadd s (bvadd t (bvmul t t))))))
(check-sat)
(exit)