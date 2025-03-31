(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul t (bvmul s (bvadd t t))) (bvmul s (bvmul t (bvadd t t)))))
(check-sat)
(exit)