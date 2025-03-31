(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvmul s (bvadd t (int_to_pbv k 0))) (bvmul s t)))
(check-sat)
(exit)