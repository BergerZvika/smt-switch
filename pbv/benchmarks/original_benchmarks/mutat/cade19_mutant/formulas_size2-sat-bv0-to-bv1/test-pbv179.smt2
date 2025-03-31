(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvule s (bvor (int_to_pbv k 1) t)) (bvule s t)))
(check-sat)
(exit)