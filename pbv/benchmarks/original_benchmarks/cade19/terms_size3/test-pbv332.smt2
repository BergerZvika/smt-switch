(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvadd t (bvnot t))) (bvneg s)))
(check-sat)
(exit)