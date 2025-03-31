(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (bvor (int_to_pbv k 0) s) t) (bvult s t)))
(check-sat)
(exit)