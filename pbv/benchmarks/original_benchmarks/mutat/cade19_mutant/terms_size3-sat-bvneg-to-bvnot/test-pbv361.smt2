(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvmul t (bvnot (int_to_pbv k 0)))) (bvor s (bvnot t))))
(check-sat)
(exit)