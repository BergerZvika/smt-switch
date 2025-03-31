(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvadd t (bvnot (int_to_pbv k 0)))) (bvor s (bvnot (bvnot t)))))
(check-sat)
(exit)