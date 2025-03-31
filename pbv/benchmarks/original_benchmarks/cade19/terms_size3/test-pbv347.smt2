(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvor s (bvor t (bvnot t))) (bvnot (int_to_pbv k 0))))
(check-sat)
(exit)