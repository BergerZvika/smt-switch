(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (not (distinct (bvor (bvor s t) (bvnot t)) (bvnot (int_to_pbv k 0)))))
(check-sat)
(exit)