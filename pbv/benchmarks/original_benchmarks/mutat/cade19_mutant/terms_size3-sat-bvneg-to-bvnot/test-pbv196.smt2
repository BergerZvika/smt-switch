(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvnot (bvadd t (bvmul s t))) (bvmul (bvnot s) t)))
(check-sat)
(exit)