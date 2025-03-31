(set-logic ALL)


(declare-const k Int)
(declare-const s (_ BitVec k))
(declare-const t (_ BitVec k))
(assert (distinct (bvult (int_to_pbv k 1) (bvadd t s)) (bvult (int_to_pbv k 0) (bvadd s t))))
(check-sat)
(exit)