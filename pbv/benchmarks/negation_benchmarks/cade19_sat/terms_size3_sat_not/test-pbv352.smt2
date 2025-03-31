(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvmul s (bvadd t (bvnot (int_to_pbv k 0)))) (bvmul s (bvnot (bvneg t))))))
(check-sat)
(exit)